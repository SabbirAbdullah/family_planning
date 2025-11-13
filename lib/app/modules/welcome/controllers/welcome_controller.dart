
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/remote/auth_api_service.dart';
import '../../work_history/controllers/work_history_controller.dart';
import '../../work_submit/controller/work_controller.dart';

class WelcomeController extends GetxController {
  final HomeController homeController = Get.put(HomeController());
  final WorkHistoryController workController = Get.put(WorkHistoryController());
  final AuthRemoteService authRemoteService = AuthRemoteService();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        Get.offAllNamed('/login_view');
        return;
      }

      // Timeout added to avoid infinite hang
      await homeController.fetchUser().timeout(const Duration(seconds: 5));

      if (homeController.user.value != null) {
        await Future.wait([
          homeController.fetchDashboard(),
          workController.fetchHistory(),
        ]);
        Get.offAllNamed('/bottom_nav_view');
      } else {
        await prefs.remove('token');
        Get.offAllNamed('/login_view');
      }
    } catch (e) {
      print("❌ Error during splash check: $e");
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      Get.offAllNamed('/login_view');
    }
  }
}
