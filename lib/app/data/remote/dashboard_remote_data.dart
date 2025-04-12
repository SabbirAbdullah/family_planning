import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DashboardRemoteService {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<Map<String, dynamic>> fetchDashboardData( Map<String, dynamic> requestBody) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      Response response = await _dio.post(
        '/api/dashboard/get-dashboard-data-for-mobile',
        data: requestBody,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        }),
      );
      return response.data;
    } catch (e) {
      throw Exception("Failed to load dashboard data");
    }
  }
}
