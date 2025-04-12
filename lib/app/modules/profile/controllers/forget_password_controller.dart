import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/reset_password.dart';
import '../../../data/remote/reset_password_remote_data.dart';
import '../../../data/repository/reset_password_repository.dart';

class ChangePasswordController extends GetxController {
  final AuthPasswordRepository repository = AuthPasswordRepository();



  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final HomeController homeController = Get.put(HomeController());

  var isLoading = false.obs;

  Future<void> changePassword() async {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "New password and confirm password do not match.");
      return;
    }

    isLoading.value = true;

    try {
      final request = ChangePasswordRequest(
        oldPassword: oldPassword,
        newPassword: newPassword,
        empId:homeController.user.value!.empId,
      );

      final response = await repository.changePassword(request);

      Get.snackbar("Success", response.message);
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();


    } catch (e) {
      Get.snackbar("Error", "Failed to change password");
    } finally {
      isLoading.value = false;
    }
  }
}
