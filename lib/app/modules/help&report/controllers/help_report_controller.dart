import 'package:family_planning/app/core/values/app_colors.dart';
import 'package:family_planning/app/data/model/help_report_model.dart';
import 'package:family_planning/app/data/remote/help_report_remote_data.dart';
import 'package:get/get.dart';
import '../../../data/repository/help_report_repository.dart';
import 'package:flutter/material.dart';

import '../../home/controllers/home_controller.dart';

class HelpReportController extends GetxController {
  // final HelpReportRepository _repository = HelpReportRepository();
  final HelpReportApiService _remote = HelpReportApiService();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  var selectedDate = DateTime.now().obs;  // Stores picked date
  var isLoading = false.obs;
  final HomeController homeController = Get.put(HomeController());


  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future<void> submitReport() async {
    if (subjectController.text.isEmpty || descriptionController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    isLoading.value = true;
    try {
      HelpReportModel report = HelpReportModel(
        empId:"${homeController.user.value!.empId}",
        subject: subjectController.text,
        description: descriptionController.text,
        date: selectedDate.value.toIso8601String().split("T")[0],  // Format date
      );

      String responseMessage = await _remote.submitHelpReport (report.toJson());
      Get.snackbar("Success", responseMessage,);

      // Clear fields after successful submission
      subjectController.clear();
      descriptionController.clear();
      selectedDate.value = DateTime.now();
    } catch (e) {
      Get.snackbar("Error", e.toString(),);
    } finally {
      isLoading.value = false;
    }
  }
}
