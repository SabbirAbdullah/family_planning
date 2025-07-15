import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/fetch work.dart';
import '../model/submit_work_form.dart';
import 'dart:convert';

class WorkApiService {
  final Dio dio = DioProvider.dioWithHeaderToken;

  Future<Response?> submitWorkForm({
    required String empId,
    required int workTypeId,
    required String date,
    required List<Map<String, dynamic>> workInfoData,
    required Map<int, String> imagePaths,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "emp_id": empId,
        "work_type_id": workTypeId,
        "date": date,
        "WorkInfoData": jsonEncode(workInfoData),
      });

      // Attach images
      for (var entry in imagePaths.entries) {
        formData.files.add(MapEntry(
          "images",
          await MultipartFile.fromFile(entry.value,
              filename: "field_${entry.key}.jpg"),
        ));
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      Response response = await dio.post(
        "/api/work/add-work-info",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return response;
    } catch (e) {
      print("API Error: $e");
      return null;
    }
  }


  Future<List<FetchWorkModel>> fetchWorkHistory({
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
      final Map<String, dynamic> body = {
        "emp_id": empId,
      };

      // Only add date filters if they are provided
      if (startDate != null && endDate != null) {
        body["startDate"] = startDate;
        body["endDate"] = endDate;
      }

      final response = await dio.post(
        '/api/work/get-all-work',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: body,
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((item) => FetchWorkModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to fetch work history');
      }
    } catch (e) {
      throw Exception('API error: $e');
    }
  }
}

