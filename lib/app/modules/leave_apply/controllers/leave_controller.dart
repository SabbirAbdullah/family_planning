
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/values/image_compresser.dart';
import '../../../data/remote/leave_remote_data.dart';
import '../../home/controllers/home_controller.dart';

class LeaveController extends GetxController {
  final LeaveRemoteData apiService = LeaveRemoteData();
  final HomeController homeController = Get.put(HomeController());
  final ImagePicker picker = ImagePicker();
  final Rx<XFile?> imageFile = Rx<XFile?>(null);
  final RxBool isLoading = false.obs;

  final TextEditingController descriptionController = TextEditingController();
  final Rx<DateTime?> startDate = Rx<DateTime?>(null);
  final Rx<DateTime?> endDate = Rx<DateTime?>(null);

  Future<void> pickAndCompressImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile.value = await compressImage(pickedFile);
    }
  }

  Future<void> pickDate({required bool isStart}) async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      if (isStart) {
        startDate.value = picked;
      } else {
        endDate.value = picked;
      }
    }
  }

  Future<void> submitLeave() async {
    if (imageFile.value == null ||
        startDate.value == null ||
        endDate.value == null ||
        descriptionController.text.isEmpty) {
      Get.snackbar(
        "Missing Fields",
        "Please fill out all fields before submitting.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final response = await apiService.submitLeave(
        image: imageFile.value!,
        empId: homeController.user.value!.empId,
        description: descriptionController.text.trim(),
        startDate: startDate.value!.toIso8601String().split("T").first,
        endDate: endDate.value!.toIso8601String().split("T").first,
      );

      Get.snackbar(
        "Success",
        "Leave submitted successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // Optional: clear form fields after success
      descriptionController.clear();
      imageFile.value = null;
      startDate.value = null;
      endDate.value = null;

    } catch (e) {
      Get.snackbar(
        "Submission Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

}
