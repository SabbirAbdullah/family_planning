import 'package:family_planning/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/remote/auth_api_service.dart';


class LoginController extends GetxController {
  final HomeController homeController = Get.put(HomeController());



  RxString token = "".obs;
  var isLoading= false.obs;

  ///login
  // Future<void> login(String empId, String password) async {
  //    isLoading.value = true;
  //   try {
  //     final response = await _authRepository.login(empId, password);
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('token', response.token);
  //     await homeController.fetchUser();
  //     Get.snackbar("Success", "Login successful");
  //
  //     Get.offAllNamed('/bottom_nav_view');
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  //   finally {
  //      isLoading.value = false;
  //   }
  //
  // }


  final AuthRemoteService _apiService = AuthRemoteService();

  Future <void> login(String empId, String password) async {
    isLoading(true);
    try {
      await _apiService.login(empId, password);
      await homeController.fetchUser();
      Get.offAllNamed('/bottom_nav_view');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }






  var isObscured = true.obs;
  var isBangla = true.obs;

  void toggleVisibility() {
    isObscured.value = !isObscured.value;
  }



  // Future<void> setUserType(UserType type) async {
  //   userType.value = type;
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userType', type.name);
  // }

  // Future<void> loadUserType() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedType = prefs.getString('userType');
  //   if (savedType != null) {
  //     userType.value = UserType.values.firstWhere((e) => e.name == savedType);
  //   }
  // }
  //
  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Get.offAllNamed('/login_view');
  }

  @override
  void onInit() {
    super.onInit();

  }


}


