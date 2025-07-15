
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/remote/auth_api_service.dart';
import '../../work_history/controllers/work_history_controller.dart';
import '../../work_submit/controller/work_controller.dart';

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
  final WorkHistoryController workController = Get.put(WorkHistoryController());
  final AuthRemoteService authRemoteService = AuthRemoteService();
  @override
  void onInit() {
    super.onInit();
    // checkConnectivity();
    // Connectivity().onConnectivityChanged.listen((status) {
    //   isConnected.value = (status != ConnectivityResult.none);
    // });
  }

  // void checkConnectivity() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   isConnected.value = (connectivityResult != ConnectivityResult.none);
  // }
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      try {
        // Attempt to fetch user using token
        await homeController.fetchUser();

        // Optional: Validate if user data is fetched properly
        if (homeController.user.value != null) {
          // Proceed to home
          await homeController.fetchDashboard();
          await workController.fetchHistory();

          Get.offAllNamed('/bottom_nav_view');
        } else {
          // Token exists but no user fetched (invalid/expired)
          await prefs.remove('token');
          Get.offAllNamed('/login_view');
        }
      } catch (e) {
        print("Error during auto-login: $e");
        await prefs.remove('token');
        Get.offAllNamed('/login_view');
      }
    } else {
      // No token found — go to login screen
      Get.offAllNamed('/login_view');
    }
  }




}