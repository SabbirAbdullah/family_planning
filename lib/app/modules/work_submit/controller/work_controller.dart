import 'package:family_planning/app/data/model/fetch%20work.dart';
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../../core/values/image_compresser.dart';

import '../../../data/model/work_type_model.dart';
import '../../../data/remote/submit_work_form_remote_data.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../data/repository/work_type_repository.dart';

class WorkController extends GetxController {
  final WorkRepository _repository = WorkRepository();
  final HomeController homeController = Get.put(HomeController());

  var workTypes = <WorkType>[].obs;
  var workFields = <WorkField>[].obs;
  var selectedWorkTypeId = Rxn<int>();

  @override
  void onInit() {
    fetchWorkTypes();

    super.onInit();
  }

    var selectedDate = ''.obs;



  void fetchWorkTypes() async {
    try {
      var result = await _repository.getWorkTypes("${homeController.user.value!.designationId}");
      workTypes.value = result;
    } catch (e) {
      Get.snackbar("Error", "Failed to load work types");
    }
  }

  void fetchWorkFields(int workTypeId) async {
    try {
      selectedWorkTypeId.value = workTypeId;
      var result = await _repository.getWorkFields(workTypeId);
      workFields.value = result;
    } catch (e) {
      Get.snackbar("Error", "Failed to load work fields");
    }
  }

  ///
/// submit work form
  final WorkApiService apiService = WorkApiService();
  var isLoading = false.obs;
  var fieldValues = <int, String>{}.obs;
  var imagePaths = <int, String>{}.obs;


  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedDate.value = picked.toIso8601String().split('T')[0];
    }
  }


  Future<void> openCameraAndCrop(int fieldId) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final compressedImage = await compressImage(pickedFile);
      if (compressedImage != null) {
        imagePaths[fieldId] = compressedImage.path;
      }
    }
  }
  Future<void> submitWorkForm() async {
    if (selectedWorkTypeId.value == null || selectedDate.value.isEmpty) {
      Get.snackbar("Error", "Please select work type and date");
      return;
    }

    List<Map<String, dynamic>> workInfoData = [];

    workFields.forEach((field) {
      if (field.fieldType == "image" && imagePaths.containsKey(field.fieldId)) {
        // Extract only the image filename
        String imagePath = imagePaths[field.fieldId]!;
        String imageName = imagePath.split('/').last; // Extract the filename

        workInfoData.add({
          "field_id": field.fieldId,
          "value": imageName, // Store only the image name
        });
      } else if (field.fieldType == "text" && fieldValues.containsKey(field.fieldId)) {
        workInfoData.add({
          "field_id": field.fieldId,
          "value": fieldValues[field.fieldId],});
      } else if (field.fieldType == "location" && fieldValues.containsKey(field.fieldId)) {
        workInfoData.add({
          "field_id": field.fieldId,
          "value": fieldValues[field.fieldId],});
      }
      else if (field.fieldType == "dropdown" && fieldValues.containsKey(field.fieldId)) {
        workInfoData.add({
          "field_id": field.fieldId,
          "value": fieldValues[field.fieldId],
        });
      }
    });
    isLoading(true);
    var response = await apiService.submitWorkForm(
      empId: "${homeController.user.value!.empId}",
      workTypeId: selectedWorkTypeId.value!,
      date: selectedDate.value,
      workInfoData: workInfoData,
      imagePaths: imagePaths, // Keep full path for actual file upload
    );

    if (response != null && response.statusCode == 201) {
      Get.snackbar("Success", "Work form submitted successfully");
      imagePaths.clear();
      fieldValues.clear();
      isLoading(false);

    } else {
      Get.snackbar("Error", response?.data["message"] ?? "Failed to submit");
    }
  }
  //////////

  // Future<void> fetchAllWork() async {
  //   try {
  //     isLoading(true);
  //     var empId = homeController.user.value?.empId; // Avoids force unwrapping
  //
  //     if (empId == null) {
  //       Get.snackbar("Error", "Employee ID is missing");
  //       return;
  //     }
  //
  //     var works = await _apiService.fetchWorks(empId);
  //     workList.assignAll(works);
  //     updateLatestWork();// Ensures reactive update
  //
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to fetch work data: $e");
  //     debugPrint("Error fetching work data: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }



  final isListening = false.obs;
  final speech = stt.SpeechToText();

  // Store the active field's ID
  var activeFieldId = ''.obs;


  // Start listening for speech-to-text
  void startListening(String fieldId) {
    activeFieldId.value = fieldId;
    isListening.value = true;
    // Implement your speech-to-text start logic here
  }

  // Stop listening for speech-to-text
  void stopListening() {
    activeFieldId.value = '';
    isListening.value = false;
    // Implement your speech-to-text stop logic here
  }


  WorkType? get selectedWorkType =>
      workTypes.firstWhereOrNull((type) => type.workTypeId == selectedWorkTypeId.value);

}


