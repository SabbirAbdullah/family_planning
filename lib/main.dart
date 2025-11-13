import 'package:family_planning/app/modules/profile/controllers/profile_controller.dart';
import 'package:family_planning/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'app/modules/authentication/controllers/login_controller.dart';
import 'app/my_app.dart';

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
 //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProfileController());
  Get.put(LoginController());

  runApp(const MyApp());
}
