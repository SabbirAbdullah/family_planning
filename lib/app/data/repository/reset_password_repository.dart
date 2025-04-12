
import '../model/reset_password.dart';
import '../remote/reset_password_remote_data.dart';

class AuthPasswordRepository {
  final AuthPasswordRemoteDataSource remote =AuthPasswordRemoteDataSource();


  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest request) {
    return remote.changePassword(request);
  }
}
