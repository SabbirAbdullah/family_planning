import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:family_planning/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../authentication/controllers/login_controller.dart';
import '../../help&report/views/help_report.dart';
import '../widgets/conditions.dart';
import '../widgets/forget_pass.dart';
import '../widgets/guidelines.dart';
import '../widgets/leave_day_info.dart';
import '../widgets/personal_info.dart';
import '../widgets/privacy_policy.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController controller = Get.put(ProfileController());
  final LoginController loginController = Get.put(LoginController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: homeController.user.value == null
                        ? Text("User Not Found", style: titleTextBlue20)
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${homeController.user.value!.name}",
                          style: titleTextBlue20,
                        ),
                        const SizedBox(height: 4),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 6,
                          children: [
                            Text("${homeController.user.value!.designation}", style: titleTextBlue14),
                            Icon(Icons.circle, size: 8),
                            Text("${homeController.user.value!.unionName}", style: titleTextBlue14),
                            Icon(Icons.circle, size: 8),
                            Text("${homeController.user.value!.empId}", style: titleTextBlue14),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipOval(
                    child: homeController.user.value?.image != null &&
                        homeController.user.value!.image!.isNotEmpty
                        ? Image.network(
                      "https://family-planning-server.mpairproject.xyz/uploads/${homeController.user.value!.image}",
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      fit: BoxFit.cover,
                    )
                        : Icon(Icons.person, size: screenWidth * 0.2),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Card options (reusable widget recommended)
              _buildOptionTile(
                icon: Icons.person,
                label: 'personal_info'.tr,
                onTap: () => Get.to(() => PersonalInfo()),
              ),
              _buildOptionTile(
                imagePath: "assets/images/leave 1.png",
                label: 'leave_application'.tr,
                onTap: () => Get.to(() => LeaveDayInfo()),
              ),
              _buildOptionTile(
                imagePath: "assets/images/report.png",
                label: 'help_report'.tr,
                onTap: () => Get.to(() => HelpReportView()),
              ),
              _buildOptionTile(
                imagePath: "assets/images/password.png",
                label: 'change_password'.tr,
                onTap: () => Get.to(() => ForgetPassView()),
              ),
              _buildOptionTile(
                imagePath: "assets/images/privacy policy.png",
                label: 'privacy_policy'.tr,
                onTap: () => Get.to(() => PrivacyPolicyPage()),
              ),

              // Language Selector
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.language, color: AppColors.appColor, size: 25),
                          const SizedBox(width: 10),
                          Text('change_language'.tr, style: grayTitleText14_500),
                        ],
                      ),
                    ),
                    Obx(
                          () => DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        value: controller.selectedLanguage.value.languageCode,

                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.changeLanguage(newValue);
                          }
                        },
                        iconSize: 20,
                        style: grayTitleText14_500,
                        dropdownColor: Colors.white,icon: Icon(Icons.arrow_forward_ios),
                        items: const [
                          DropdownMenuItem(value: 'bn', child: Text('বাংলা')),
                          DropdownMenuItem(value: 'en', child: Text('English')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              Divider(color: const Color(0xffe0e0e0)),
              const SizedBox(height: 8),

              // Logout
              _buildOptionTile(
                imagePath: "assets/images/logout.png",
                label: "logout".tr,
                iconColor: Colors.grey,
                onTap: () async {
                  loginController.logout();
                },
              ),

              const SizedBox(height: 20),
              // Footer
              Container(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => ConditionsPage()),
                          child: Text("conditions".tr, style: titleTextBlue14),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => Get.to(() => GuidelinesPage()),
                          child: Text("guidelines".tr, style: titleTextBlue14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Developed By ", style: grayTitleText14),
                        Text(
                          "mPair Technologies Ltd.",
                          style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    IconData? icon,
    String? imagePath,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (icon != null)
                Icon(icon, color: iconColor ?? AppColors.appColor, size: 25),
              if (imagePath != null)
                Image.asset(imagePath, height: 25, width: 25, color: iconColor ?? AppColors.appColor),
              const SizedBox(width: 10),
              Text(label, style: grayTitleText14_500),
            ],
          ),
        ),
      ),
    );
  }
}

