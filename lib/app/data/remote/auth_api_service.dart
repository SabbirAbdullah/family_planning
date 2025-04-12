import 'package:dio/dio.dart';
import '../../network/dio_provider.dart';
import '../model/login_model.dart';
import '../model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteService {
  // final String baseUrl = "http://192.168.1.5:5000";
  final Dio _dio = DioProvider.dioWithHeaderToken;
  Future<LoginResponse> login(String empId, String password) async {
    try {
      final response = await _dio.post('/api/auth/login', data: {
        'emp_id': empId,
        'password': password,
      });

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginResponse.token);
        return loginResponse;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<UserModel> getUserFromToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found');
    }

    try {
      final response = await _dio.post('/api/auth/get-user-from-token',
          data: {'token': token},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  //
  // Future<LoginResponse> login(String empId, String password) async {
  //   try {
  //     final response = await _dio.post(
  //       "$baseUrl/api/auth/login",
  //       data: {"emp_id": empId, "password": password},
  //     );
  //     if (response.statusCode == 200) {
  //       final loginResponse = LoginResponse.fromJson(response.data);
  //       // Save token in SharedPreferences
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('token', loginResponse.token);
  //       return loginResponse;
  //     } else {
  //       throw Exception('Failed to login');
  //     }
  //   } catch (e) {
  //     throw Exception('Login Error: $e');
  //   }
  // }
  //
  // Future<UserModel> getUserFromToken() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('token') ?? '';
  //     if (token == null) throw Exception('Token not found');
  //     final response = await _dio.post(
  //       "$baseUrl/api/auth/get-user-from-token",
  //       options: Options(headers: {"Authorization": "Bearer $token"}),
  //       data: {"token": token},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return UserModel.fromJson(response.data['user']);
  //     } else {
  //       throw Exception("Failed to fetch user data");
  //     }
  //   }catch (e) {
  //     throw Exception('Fetch User Info Error: $e');
  //   }
  // }
}
