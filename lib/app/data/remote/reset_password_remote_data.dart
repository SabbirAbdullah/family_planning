import 'package:dio/dio.dart';
import 'package:family_planning/app/network/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/reset_password.dart';

class AuthPasswordRemoteDataSource {
  final Dio dio= DioProvider.dioWithHeaderToken;

  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }
    final response = await dio.post(
      '/api/auth/reset-password',
      data: request.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return ChangePasswordResponse.fromJson(response.data);
  }
}
