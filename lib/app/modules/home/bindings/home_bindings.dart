import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';



class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}