
import 'package:image_picker/image_picker.dart';

import 'package:family_planning/app/modules/attendance_list/controllers/attendance_history_controller.dart';
import 'package:family_planning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';


import '../../../core/values/image_compresser.dart';
import '../../../core/values/location_map_controller.dart';
import '../../../data/model/attendance_model.dart';
import '../../../data/remote/attendance_api_service.dart';


class AttendanceController extends GetxController {
  var date = "".obs;
  var inTime = "".obs;
  var type = "In".obs;
  var description = "".obs;
  var location = "".obs;
  var lat = "".obs;
  var longi = "".obs;
  final RxBool isLoading = false.obs;
  final RxString message = ''.obs;

  final AttendanceRemoteService _remote = AttendanceRemoteService();
  final HomeController homeController = Get.put(HomeController());
  final LocationController locationController = Get.put(LocationController());
  final TextEditingController desController = TextEditingController();
  final AttendanceHistoryController attendanceHistoryController = Get.put(AttendanceHistoryController());

  @override
  void onInit() {
    super.onInit();
      DateTime now = DateTime.now();
      date.value = now.toString().split(" ")[0];
      inTime.value = "${now.hour}:${now.minute}:${now.second}";

    locationController.getLocation();
  }
  void pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      date.value = pickedDate.toString().split(" ")[0];
      TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        inTime.value = "${pickedTime.hour}:${pickedTime.minute}:00";
      }
    }
  }

  final ImagePicker picker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);

  Future<void> pickAndCompressImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final compressedImage = await compressImage(pickedFile);
      image.value = compressedImage;  // Update the image with compressed file
    }
  }
  void getCurrentLocation() async {
    lat.value = "${locationController.latitude.value}";
    longi.value = "${locationController.longitude.value}";
    location.value = "${locationController.address.value}";
  }

  Future<void> addAttendance() async {
    final imageFile = image.value;
    if (imageFile == null) {
      Get.snackbar('Error', "Please select an image.",backgroundColor: Colors.white);
      return;
    }

    if (!attendanceHistoryController.isSubmitEnabled.value) {
      Get.snackbar("Error", "You have already submitted attendance.",backgroundColor: Colors.white);
      return; // ❌ Prevent submission
    }

    final attendance = AttendanceModel(
      empId: homeController.user.value?.empId ?? '',
      date: date.value,
      inTime: inTime.value,
      type: attendanceHistoryController.attendanceType.value,
      description: desController.text,
      location: locationController.address.value,
      lat: locationController.latitude.value,
      longi: locationController.longitude.value,
    );

    isLoading.value = true;
    try {
      message.value = await _remote.addAttendance(attendance, imageFile);
      isLoading.value = false;
      Get.snackbar('Success', message.value, backgroundColor: Colors.white);


      // Clear/reset the form
      desController.clear();
      attendanceHistoryController.attendanceType.value = "";
      date.value = "";
      inTime.value = "";
      image.value = null;
      locationController.address.value = "";

      // Refresh attendance history
      await attendanceHistoryController.fetchAttendance();
    } catch (e) {
      message.value = e.toString();
      isLoading.value = false;
      Get.snackbar('Error', message.value,backgroundColor: Colors.white);
    }
  }

// Future<void> _pickImageFromGalleryAndCompress() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     image.value = await compressImage(pickedFile);
  //   }
  // }

  // Future<void> openCameraAndCrop() async {
  //   // Step 1: Open Camera to Take a Picture
  //   final XFile? pickedImage = await _picker.pickImage(
  //     source: ImageSource.camera,
  //   );
  //
  //   if (pickedImage != null) {
  //     // Step 2: Crop the Image
  //     CroppedFile? croppedImage = await ImageCropper().cropImage(
  //       sourcePath: pickedImage.path,
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           toolbarColor: Colors.blue,
  //           toolbarWidgetColor: Colors.white,
  //           hideBottomControls: true,
  //           lockAspectRatio: false,
  //           aspectRatioPresets: [
  //             CropAspectRatioPreset.square,
  //             CropAspectRatioPreset.ratio3x2,
  //             CropAspectRatioPreset.original,
  //             CropAspectRatioPreset.ratio4x3,
  //             CropAspectRatioPreset.ratio16x9,
  //           ],
  //         ),
  //         IOSUiSettings(title: 'Crop Image',
  //           aspectRatioPresets: [
  //             CropAspectRatioPreset.square,
  //             CropAspectRatioPreset.ratio3x2,
  //             CropAspectRatioPreset.original,
  //             CropAspectRatioPreset.ratio4x3,
  //             CropAspectRatioPreset.ratio16x9,
  //           ],),
  //       ],
  //     );
  //
  //     if (croppedImage != null) {
  //       // Step 3: Update State with Cropped Image Path
  //       imagePath.value = croppedImage.path;
  //     }
  //   }
  // }


  // void pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     imagePath.value = image.path; // Store full file path, not just the name
  //   }
  // }
  // 📸 Pick Image
  // Function to pick an image from the camera












// Future<void> submitAttendance() async {
//   if (!attendanceHistoryController.isSubmitEnabled.value) {
//     Get.snackbar("Error", "You have already submitted attendance.");
//     return;
//   }
//
//   // Create a new attendance model
//   AttendanceModel attendance = AttendanceModel(
//     empId: "${homeController.user.value!.empId}",
//     date: date.value,
//     inTime: inTime.value,
//     type: "${attendanceHistoryController.attendanceType.value}",
//     description: desController.text,
//     location: "${locationController.address.value}",
//     lat: "${locationController.latitude.value}",
//     longi: "${locationController.longitude.value}",
//     image: imageFile.value!,
//     // Only the image name, not the full path
//   );
//
//
//
//   // Make the network call
//   var response = await _remote.submitAttendance(attendance);
//
//   if (response) {
//     Get.snackbar('Success', 'Attendance added successfully');
//   } else {
//     Get.snackbar('Error', 'Failed to add attendance');
//   }
//
//   // Reset fields after submission
//   await attendanceHistoryController.fetchAttendance();
//   desController.clear();
//   attendanceHistoryController.attendanceType.value = "";
//   date.value = "";
//   inTime.value = "";
//
//   locationController.address.value = "";
// }


}

