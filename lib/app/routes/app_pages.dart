import 'package:family_planning/app/modules/fwa_validation/bindings/fwa_validation_bindings.dart';
import 'package:family_planning/app/modules/fwa_validation/bindings/fwa_work_bindings.dart';
import 'package:family_planning/app/modules/fwa_validation/views/fwa_validation.dart';
import 'package:family_planning/app/modules/fwa_validation/views/fwa_work.dart';
import 'package:family_planning/app/modules/welcome/views/splash%20_screen.dart';
import 'package:get/get.dart';
import '../modules/authentication/bindings/login_binding.dart';
import '../modules/authentication/views/login_view.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/botton_nav_binding.dart';
import '../modules/main/views/bottom_nav_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [

    GetPage(
      name: _Paths.MAIN,
      page: () => BottomNavBar(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding:WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.FWAWORK,
      page: () => FwaWork(),
      binding:FwaWorkBindings(),
    ),
    GetPage(
      name: _Paths.FWAVALIDATION,
      page: () => FwaValidation(),
      binding:FwaValidationBindings(),
    ),



  ];
}