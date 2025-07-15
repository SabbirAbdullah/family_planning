import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/leave_model.dart';
import '../../../data/repository/leave_repository.dart';
import '../../home/controllers/home_controller.dart';

class ProfileController extends GetxController {
  final LeaveRequestRepository _repository = LeaveRequestRepository();
  final HomeController homeController = Get.put(HomeController());
  var leaves = <LeaveModel>[].obs;
  var isLoading = false.obs;
  var  startDate = DateTime.now().obs;
  var  endDate = DateTime.now().obs;

  Future<void> fetchLeaves() async {
    try {
      isLoading.value = true;
      final result = await _repository.getLeaveData(
        empId: homeController.user.value!.empId,
        startDate: DateFormat('yyyy-MM-dd').format(startDate.value),
        endDate: DateFormat('yyyy-MM-dd').format(endDate.value),
      );
      leaves.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  final expandedIndexes = <int>{}.obs;

  void toggleExpand(int index) {
    if (expandedIndexes.contains(index)) {
      expandedIndexes.remove(index);
    } else {
      expandedIndexes.add(index);
    }
  }


  final showAttachmentIndexes = <int>{}.obs;

  void toggleAttachment(int index) {
    if (showAttachmentIndexes.contains(index)) {
      showAttachmentIndexes.remove(index);
    } else {
      showAttachmentIndexes.add(index);
    }
  }




    var selectedDate = ''.obs;

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }



  var selectedLanguage = const Locale('bn').obs;
  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage(); // Load saved language on initialization
  }

  void changeLanguage(String languageCode) async {
    final locale = Locale(languageCode);
    selectedLanguage.value = locale;

    Get.updateLocale(locale);

    // Save language to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }

  String get fontFamily {
    return selectedLanguage.value == 'bn' ? 'AnekBangla' : 'Roboto';
  }

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language') ?? 'bn';
    selectedLanguage.value = Locale(savedLanguage);
    Get.updateLocale(Locale(savedLanguage));
  }
}