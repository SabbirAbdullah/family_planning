import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/help&report/views/help_report.dart';
import '../model/help_report_model.dart';


class HelpReportApiService {
  final Dio _dio = DioProvider.dioWithHeaderToken;

  Future<String> submitHelpReport(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      Response response = await _dio.post(
        "/api/other/add-help-report",
        data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'})

      );
      return response.data["message"];

    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
