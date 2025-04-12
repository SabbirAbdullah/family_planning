import 'dart:io';

import 'package:family_planning/app/core/values/custom_button.dart';
import 'package:family_planning/app/core/values/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_field_decoration.dart';
import '../../../core/values/text_styles.dart';
import '../../../data/model/leave_request_model.dart';
import '../../../core/values/voice_to_text_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/leave_controller.dart';

class LeaveApplyView extends StatelessWidget {
  final LeaveController controller = Get.put(LeaveController());

  final HomeController homeController = Get.put(HomeController());

  final VoiceController voiceController = Get.put(VoiceController());
  final RxBool isListening = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('apply_leave'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'application_date'.tr,
                            style: titleTextBlue16,
                          ),
                          Text(
                            ' : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.pickDate(isStart: true),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.borderColor),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    controller.startDate.value
                                            ?.toString()
                                            .split(" ")
                                            .first ??
                                        "তারিখ নির্বাচন করুন ",
                                    style: grayTitleText14_500
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("থেকে", style: titleTextBlue14),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.pickDate(isStart: false),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                ),
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  controller.endDate.value
                                          ?.toString()
                                          .split(" ")
                                          .first ??
                                      "তারিখ নির্বাচন করুন",
                                  style: grayTitleText14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              Text('application_picture'.tr, style: titleTextBlue16),
              SizedBox(height: 8,),
              Obx(
                () => ImagePickerBox(image: controller.imageFile.value, onTap: (){
                  controller.pickAndCompressImage();
                })
              ),
              SizedBox(height: 16),
              Text('description'.tr, style: titleTextBlue16),
              SizedBox(height: 8,),
              VoiceInputField(
                maxLines: 5,
                textController: controller.descriptionController,
                onMicPressed: () {
                  voiceController.toggleListening(
                    controller.descriptionController,
                    voiceController
                        .isListeningLeaveDetail, // Pass specific isListening state
                  );
                },
                isListening: voiceController
                    .isListeningLeaveDetail, // Bind specific isListening state
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => CustomButton(
                  text: 'submit'.tr,
                  isLoading: controller.isLoading.value,
                  onPressed: () {
                    controller.submitLeave();
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
