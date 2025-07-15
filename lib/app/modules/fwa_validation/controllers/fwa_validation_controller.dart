import 'package:family_planning/app/data/model/fwa_validation_model.dart';
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../../../data/repository/fwa_validation_repository.dart';

class FwaValidationController extends GetxController {
  final FwaValidationRepository _repository = FwaValidationRepository();
  final HomeController homeController = Get.put(HomeController());
  RxList<FwaValidationModel> workList = <FwaValidationModel>[].obs;
  var isLoading = false.obs;
  var selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;

  @override
  void onInit() {
    fetchFwaWorkList();
    super.onInit();
  }

  void fetchFwaWorkList() async {
    isLoading(true);
    var designationId = homeController.user.value!.designationId;
    var upazilaId = homeController.user.value!.upazilaId;
    var unionId = homeController.user.value!.unionId;
    var unitId = homeController.user.value!.unitId;
    var district = "${homeController.user.value!.district}";

    try {

      var works = await _repository.getWorkList(designationId, upazilaId, unionId, unitId, district, selectedDate.value);
      workList.value = works;
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void updateWorkStatus(int workId, String status) async {
    isLoading(true);
    try {
      var message = await _repository.updateWorkStatus(workId, status);
      Get.snackbar("Success", message,backgroundColor: Colors.white);
      fetchFwaWorkList(); // Refresh list after update
    } catch (e) {
      Get.snackbar("Error", "Failed to update status");
    } finally {
      isLoading(false);
    }
  }

  void updateDate(String newDate) {
    selectedDate.value = newDate;
    fetchFwaWorkList();
  }
}
