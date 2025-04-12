import 'package:family_planning/app/core/values/custom_button.dart';
import 'package:family_planning/app/modules/authentication/controllers/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';


class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());
  final TextEditingController empIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground,
      ),
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo.png",
              height: screenHeight * .15,
              width: screenWidth * .35,
              fit: BoxFit.cover,
            ),
            Text("login_title".tr, style: titleText20),
            Text("login_subtitle".tr, style: grayTitleText14),
            const SizedBox(height: 24),

            // Employee ID Field
            Text("mobile_number".tr, style: grayTitleText14_600),
            const SizedBox(height: 6),
            _buildInputField(empIdController),

            const SizedBox(height: 20),

            // Password Field
            Text("password".tr, style: grayTitleText14_600),
            const SizedBox(height: 6),
            Obx(() => _buildInputField(
              passwordController,
              obscureText: controller.isObscured.value,
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isObscured.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: controller.toggleVisibility,
              ),
            )),

            const SizedBox(height: 30),

            // Login Button with Loader
            Obx(() => CustomButton(
              text: "login".tr,
              isLoading: controller.isLoading.value,
              onPressed: () {
                if (!controller.isLoading.value) {
                  controller.login(
                    empIdController.text.trim(),
                    passwordController.text.trim(),
                  );
                }
              },
            )),

          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      TextEditingController controller, {
        bool obscureText = false,
        Widget? suffixIcon,
        String hintText = '',
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: AppColors.appColor,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xffE8E8E8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xffE8E8E8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xffE8E8E8)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
