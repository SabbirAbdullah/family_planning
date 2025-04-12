import 'package:dio/dio.dart';
import 'package:family_planning/app/data/model/leave_model.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class LeaveRemoteData {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<Response> submitLeave({
    required XFile image,
    required String empId,
    required String description,
    required String startDate,
    required String endDate,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    final mimeType = lookupMimeType(image.path) ?? 'image/jpeg';
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
        contentType: MediaType.parse(mimeType),
        filename: basename(image.path),
      ),
    });

    final url =
        "/api/leave/add-leave/$empId/$description/$startDate/$endDate";

    return await _dio.post(
      url,
      data: formData,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
  // Future<String> submitLeave({
  //   required String userId,
  //   required String description,
  //   required String startDate,
  //   required String endDate,
  //   required File image,
  // }) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //
  //   if (token == null) {
  //     throw Exception('No token found');
  //   }
  //   try {
  //     final mimeType = lookupMimeType(image.path);
  //     final fileName = basename(image.path);
  //
  //     FormData formData = FormData.fromMap({
  //       "image": await MultipartFile.fromFile(
  //         image.path,
  //         filename: fileName,
  //         contentType: mimeType != null ? MediaType.parse(mimeType) : null,
  //       ),
  //     });
  //
  //     final response = await _dio.post(
  //       "/api/leave/add-leave/$userId/$description/$startDate/$endDate",
  //       data: formData,
  //       options: Options(headers: {'Authorization': 'Bearer $token',
  //         'Content-Type': 'multipart/form-data',}),
  //     );
  //
  //     return response.data;
  //   } catch (e) {
  //     throw Exception("Error submitting leave: $e");
  //   }
  // }

  Future<List<dynamic>> fetchLeave({
    required String empId,
    String? startDate,
    String? endDate,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      final response = await _dio.post(
        "/api/leave/get-leave",
        data: {
          "emp_id": empId,
          "startDate": startDate,
          "endDate": endDate,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token',},
        ),
      );

      return response.data['data'];
    } catch (e) {
      throw Exception("Failed to load leave data: $e");
    }
  }
}
