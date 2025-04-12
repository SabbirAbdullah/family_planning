import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/work_type_model.dart';


class WorkService {
  final Dio _dio = DioProvider.dioWithHeaderToken;


  Future<List<WorkType>> fetchWorkTypes(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      Response response = await _dio.post(
        "/api/work/get-assign-workType",
        data: {"id": id},
          options: Options(headers: {'Authorization': 'Bearer $token'})
      );

      List data = response.data;
      return data.map((json) => WorkType.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load work types");
    }
  }

  Future<List<WorkField>> fetchWorkFields(int workTypeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      Response response = await _dio.post("/api/work/get-work-fields",
        data: {"work_type_id": workTypeId},
          options: Options(headers: {'Authorization': 'Bearer $token'})
      );

      List data = response.data;
      return data.map((json) => WorkField.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load work fields");
    }
  }
}
