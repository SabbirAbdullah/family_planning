import 'package:family_planning/app/modules/fwa_validation/controllers/fwa_validation_controller.dart';
import 'package:get/get.dart';



class FwaValidationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FwaValidationController>(() => FwaValidationController());
  }
}
