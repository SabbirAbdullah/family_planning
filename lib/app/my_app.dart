
import 'package:family_planning/app/modules/profile/controllers/profile_controller.dart';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../flavors/build_config.dart';
import '../flavors/env_config.dart';

import '../translate/translate.dart';
import '/app/routes/app_pages.dart';

import 'bindings/initial_binding.dart';
import 'core/values/app_colors.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // late final WebViewController controller;
 // final WelcomeController welcomeController = WelcomeController();
  @override
  void initState() {
    super.initState();
    configLoading();
    // controller = WebViewController();

  }
 final EnvConfig _envConfig = BuildConfig.instance.config;

  void configLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
  }
  @override
  Widget build(BuildContext context) {

    final ProfileController profileController = Get.put(ProfileController());

    return Obx(() {
      Locale currentLocale = profileController.selectedLanguage.value;

      return GetMaterialApp(
        title: _envConfig.appName,
        translations: AppTranslations(),
        locale: currentLocale,
        fallbackLocale: const Locale('bn'), // Default to Bangla
        defaultTransition: Transition.leftToRight,
        initialBinding: InitialBinding(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // home: SplashScreen(),
        builder: EasyLoading.init(),
        theme: ThemeData(
          fontFamily: 'AnekBangla',
          scaffoldBackgroundColor: AppColors.pageBackground,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.appBarColor,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          primarySwatch: AppColors.colorPrimarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          primaryColor: AppColors.colorPrimary,
          // textTheme: TextTheme(
          //   bodyLarge: TextStyle(
          //     fontFamily:'AnekBangla',
          //     fontSize: 18.0,
          //   ),
          //   bodyMedium: TextStyle(
          //     fontFamily: 'AnekBangla',
          //     fontSize: 14.0,
          //   ),
          //   bodySmall:  TextStyle(
          //     fontFamily:'AnekBangla',
          //     fontSize: 12.0,
          //   ),
          //   labelLarge: const TextStyle(
          //     color: Colors.white,
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.bold,
          //     fontFamily: 'AnekBangla'
          //   ),
          // ),
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}


