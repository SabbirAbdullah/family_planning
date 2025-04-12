import 'package:family_planning/app/core/values/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/forget_password_controller.dart';
import '../controllers/profile_controller.dart';

class ForgetPassView extends StatelessWidget {
  ForgetPassView({super.key});

  final TextEditingController textController = TextEditingController();
  final ChangePasswordController controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.appColor, // Replace with your AppBar's background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: AppBar(
            toolbarHeight: 80,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('change_password'.tr),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),

            Text('current_password'.tr,style: titleTextBlue16,),
            SizedBox(height: 8,),
            TextInputField(textController:  controller.oldPasswordController, isPassword: true,),
            SizedBox(height: 16,),
            Text('new_password'.tr,style: titleTextBlue16,),
            SizedBox(height: 8,),
            TextInputField(textController: controller.newPasswordController, isPassword: true,),
            SizedBox(height: 16,),
            Text('confirm_new_password'.tr,style: titleTextBlue16,),
            SizedBox(height: 8,),
            TextInputField(textController:  controller.confirmPasswordController, isPassword: true,),
            SizedBox(height: 20,),
            CustomButton(text: "পাসওয়ার্ড পরিবর্তন করুন", onPressed: (){
              controller.changePassword();
            }),


          ],
        ),
      ),
    );
  }
}
class TextInputField extends StatefulWidget {
  final TextEditingController textController;
  final int? maxLines;
  final bool? readOnly;
  final bool isPassword;

  const TextInputField({
    Key? key,
    required this.textController,
    this.maxLines = 1,
    this.readOnly = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      readOnly: widget.readOnly!,
      cursorColor: AppColors.appColor,
      cursorHeight: 20,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      obscureText: widget.isPassword ? _obscureText : false,
      style: formFieldText18,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 0),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: _toggleVisibility,
        )
            : null,
      ),
    );
  }
}


//
// class ChangePasswordView extends StatelessWidget {
//   final ChangePasswordController controller = Get.put(ChangePasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Change Password")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() => Column(
//           children: [
//             TextField(
//               controller: controller.oldPasswordController,
//               decoration: InputDecoration(labelText: "Old Password"),
//               obscureText: true,
//             ),
//             TextField(
//               controller: controller.newPasswordController,
//               decoration: InputDecoration(labelText: "New Password"),
//               obscureText: true,
//             ),
//             TextField(
//               controller: controller.confirmPasswordController,
//               decoration: InputDecoration(labelText: "Confirm New Password"),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             controller.isLoading.value
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: () =>
//                   controller.changePassword(),
//               child: Text("Change Password"),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }
