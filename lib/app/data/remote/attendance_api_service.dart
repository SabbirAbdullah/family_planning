import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import '../../network/dio_provider.dart';
import '../model/attendance_history.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/attendance_model.dart';

class AttendanceRemoteService {
  final Dio _dio = DioProvider.dioWithHeaderToken;


  Future<String> addAttendance(AttendanceModel attendance, XFile? imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      FormData formData = FormData.fromMap(attendance.toJson());

      if (imageFile != null) {
        final mimeTypeData = lookupMimeType(imageFile.path)!.split('/');
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(
            imageFile.path,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
          ),
        ));
      }

      final response = await _dio.post(
        '/api/attendance/add-attendance',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to add attendance');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message'] ?? 'Dio error: ${e.message}');
      } else {
        throw Exception('Dio error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  Future<List<AttendanceHistoryModel>> fetchAttendance(
      {String? empId, String? startDate, String? endDate}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      final response = await _dio.post('/api/attendance/get-attendance',
          data: {
            'emp_id': empId,
            'startDate': startDate,
            'endDate': endDate,
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return (response.data as List)
          .map((json) => AttendanceHistoryModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load attendance');
    }
  }
}
