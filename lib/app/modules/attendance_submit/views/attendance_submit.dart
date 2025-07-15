import 'dart:io';

import 'package:family_planning/app/core/values/custom_button.dart';
import 'package:family_planning/app/modules/attendance_list/controllers/attendance_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/image_picker.dart';
import '../../../core/values/location_map_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_field_decoration.dart';
import '../../../core/values/text_styles.dart';

import '../../../core/values/voice_to_text_controller.dart';
import '../../../data/model/attendance_model.dart';


import '../../home/controllers/home_controller.dart';
import '../controllers/attendance_controller.dart';


class AttendanceSubmit extends StatelessWidget {
   AttendanceSubmit({super.key});

  final controller = Get.put(AttendanceController());

  final attendanceHistoryController = Get.put(AttendanceHistoryController());

  final homeController = Get.put(HomeController());

  final LocationController locationController = Get.put(LocationController());

  final VoiceController voiceController = Get.put(VoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('submit_attendance'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateTimeRow(),
            const SizedBox(height: 16),
            _buildAttendanceTypeColumn(),
            const SizedBox(height: 16),
            Text('picture'.tr, style: titleTextBlue16),
            SizedBox(height: 8,),
            Obx(
                    () => ImagePickerBox(image: controller.image.value, onTap: (){
                  controller.pickAndCompressImage();
                })
            ),
            const SizedBox(height: 16),
            Text('description'.tr, style: titleTextBlue16),
            SizedBox(height: 8,),
            VoiceInputField(
              maxLines: 5,
              textController: controller.desController,
              onMicPressed: () => voiceController.toggleListening(
                controller.desController,
                voiceController.isListeningAttendDesController,
              ),
              isListening: voiceController.isListeningAttendDesController,
            ),
            const SizedBox(height: 20),
           Obx(()=>  CustomButton(
             isLoading: controller.isLoading.value,
             onPressed: controller.addAttendance,
             snackbarMessage: controller.message.value,
             text: 'submit'.tr,
           ),),

          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeRow() {
    return Obx(() => Row(
      children: [
        _buildLabelContainer('date'.tr, controller.date.value),
        const SizedBox(width: 6),
        _buildLabelContainer('time'.tr, controller.inTime.value),
      ],
    ));
  }

  Widget _buildLabelContainer(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(label, style: titleTextBlue16),
          SizedBox(height: 6,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Text(value, style: cardTextStyle14_500)),

        ],
      ),
    );
  }

  Widget _buildAttendanceTypeColumn() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("attendance_type".tr, style: titleTextBlue16),
        SizedBox(height: 8,),
        Container(
          width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Text(
              attendanceHistoryController.attendanceType.value,
              style: cardTextStyle14_500,
            ),
          ),

      ],
    ));
  }
}

class TestSnackbarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.rawSnackbar(
              message: "This is a raw snackbar!",
              backgroundColor: Colors.blue,
            );

          },
          child: Text("Show Snackbar"),
        ),
      ),
    );
  }
}