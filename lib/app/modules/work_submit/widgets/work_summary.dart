import 'dart:io';

import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/custom_button.dart';
import '../controller/work_controller.dart';

class WorkFormSummaryScreen extends StatelessWidget {
  final WorkController controller = Get.put(WorkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('summary'.tr)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('date'.tr, style: titleTextBlue16),
            Text(" ${controller.selectedDate.value}",style: cardTextStyle14_500,),
            SizedBox(height: 12),
            Text('work_type'.tr, style: titleTextBlue16),
            Text('${controller.selectedWorkType?.workType ?? ''}',style: cardTextStyle14_500,),


            ...controller.workFields.map((field) {
              final value = controller.fieldValues[field.fieldId];

              if (field.fieldType == 'image') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12,),
                    Text('${field.field}', style: titleTextBlue16),
                    controller.imagePaths.containsKey(field.fieldId)
                        ? Image.file(File(controller.imagePaths[field.fieldId]!),
                        height: 200, fit: BoxFit.cover)
                        : Text('No image selected'),
                    SizedBox(height: 16),
                  ],
                );
              }

              return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16,),
                    Text('${field.field}',style: titleTextBlue16,),
                    Text("${value ?? 'Not filled'}",style: cardTextStyle14_500,)
                  ],
                );
            }).toList(),

            SizedBox(height: 20),
            Obx(()=> CustomButton(
              isLoading: controller.isLoading.value,
              onPressed: () async {
                await controller.submitWorkForm();
                Navigator.pop(context);
              },
              text: 'submit'.tr,
            ))
          ],
        ),
      ),
    );
  }
}
