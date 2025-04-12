import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/notice_model.dart';


class NoticeRemoteData {
  final Dio _dio = DioProvider.dioWithHeaderToken;



  Future<List<NoticeModel>> fetchNotices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    try {
      final response = await _dio.post("/api/other/get-notice",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['notices'];
        return data.map((json) => NoticeModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notices');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
