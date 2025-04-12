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

  Future<List<FetchWorkModel>> fetchWorks(String empId) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }

    try {
      final response = await dio.post(
        "/api/work/get-all-work",
        data: {'emp_id': empId},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      List data = response.data;
      return data.map((e) => FetchWorkModel.fromJson(e)).toList();
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}

// class WorkApiService {
//   final Dio _dio = DioProvider.dioWithHeaderToken;
//
//   Future<String> submitWorkForm(SubmitWorkForm form) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//
//     if (token == null) {
//       throw Exception('No token found');
//     }
//     try {
//       final response = await _dio.post(
//         "/api/work/add-work-info",
//         options: Options(
//           headers: {"Authorization": "Bearer $token"},),
//         data: form.toJson(),
//       );
//
//       if (response.statusCode == 200) {
//         return response.data["message"];
//       } else {
//         throw Exception("Failed to submit work form");
//       }
//     } catch (e) {
//       throw Exception("Error submitting work form: $e");
//     }
//   }
// }
