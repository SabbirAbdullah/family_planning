import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';

import '../model/fwa_validation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FwaValidationRemoteData {
  final Dio _dio = DioProvider.dioWithHeaderToken;


  Future<List<FwaValidationModel>> fetchWorkList(int designationId,int upazilaId, int unionId, int unitId, String district, String dateFilter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      Response response = await _dio.post(
        "/api/report/get-work-list-for-validation",
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "designation_id": designationId,
          "district": district,
          "upazila_id": upazilaId,
          "union_id": unionId,
          "unit_id": unitId,
          "DateFilter": dateFilter,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => FwaValidationModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch work list");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }



  Future<String> updateWorkStatus(int workId, String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }

    try {
      Response response = await _dio.post(
        "/api/report/update-work-status",
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "id": workId,
          "status": status,
        },
      );

      if (response.statusCode == 200) {
        return response.data["message"];
      } else {
        throw Exception("Failed to update status");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

}

