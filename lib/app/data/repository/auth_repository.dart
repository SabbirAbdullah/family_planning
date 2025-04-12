
import '../model/login_model.dart';
import '../model/user_model.dart';
import '../remote/auth_api_service.dart';

class AuthRepository {
  final AuthRemoteService _apiService = AuthRemoteService();

  Future<LoginResponse> login(String empId, String password) {
    return _apiService.login(empId, password);
  }

  Future<UserModel> getUserFromToken() {
    return _apiService.getUserFromToken();
  }
}