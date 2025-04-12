import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../work_submit/controller/controller.dart';

class WelcomeController extends GetxController{
  // @override
  // void onInit() {
  //   super.onInit();
  //   // Navigate to HomeView after 2 seconds
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.off(() => ()); // Replace with your main view
  //   });
  // }

  var isConnected = true.obs;
final HomeController homeController = Get.put(HomeController());
  final WorkController workController = Get.put(WorkController());
  @override
  void onInit() {
    super.onInit();
    // checkConnectivity();
    // Connectivity().onConnectivityChanged.listen((status) {
    //   isConnected.value = (status != ConnectivityResult.none);
    // });


  }

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = (connectivityResult != ConnectivityResult.none);
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      try {
        await homeController.fetchUser();
        await homeController.fetchDashboard();
        await workController.fetchAllWork();

        await // Authenticate with stored credentials
        Get.offAllNamed('/bottom_nav_view'); // Navigate to home if valid
      } catch (e) {
        print("Authentication failed, redirecting to login.");
        Get.offAllNamed('/login_view');
      }
    } else {
      Get.offAllNamed('/login_view'); // No credentials found, navigate to login
    }
  }


}