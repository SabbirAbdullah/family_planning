import 'package:family_planning/app/core/values/custom_button.dart';
import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import '../../../core/values/location_map_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_field_decoration.dart';
import '../../../core/values/voice_to_text_controller.dart';
import '../controllers/help_report_controller.dart';

class HelpReportView extends StatelessWidget {
  HelpReportView({super.key});
   final VoiceController voiceController = Get.put(VoiceController());
   final RxBool isListening = false.obs;
   final HelpReportController controller = Get.put(HelpReportController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('help_report'.tr),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Text(
                      'date'.tr,
                      style: titleTextBlue16,
                    ),
                     SizedBox(height: 8,),
                     Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                            Border.all(color: AppColors.borderColor)),
                        child: Obx(() => TextButton(
                              onPressed: () => controller.pickDate(context),
                              child: Text(controller.selectedDate.value.toString().split(" ")[0],
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black87)),
                            )
                      
                        ),
                      ),

              SizedBox(height: 16,),

              Text('subject'.tr, style:titleTextBlue16),
              SizedBox(height: 8,),
              VoiceInputField(maxLines: 1,
                textController: controller.subjectController,
                onMicPressed:() {
                  voiceController.toggleListening(
                    controller.subjectController,
                    voiceController.isListeningFeedback, // Pass specific isListening state
                  );
                }, isListening: isListening,),
               // Container(
               //    width: double.infinity,
               //    decoration: BoxDecoration(
               //        color: Colors.white,
               //        borderRadius: BorderRadius.circular(10),
               //        border:
               //        Border.all(color: AppColors.borderColor)),
               //    child: Padding(
               //      padding: const EdgeInsets.only(left: 8.0),
               //      child: TextField(controller: controller.subjectController, decoration: InputDecoration(hintText: "Enter subject",border: InputBorder.none)),
               //    ),
               //  ),

              SizedBox(height: 16,),

              Text('give_feedback'.tr,style: titleTextBlue16,),

              VoiceInputField(maxLines: 5,
                textController: controller.descriptionController,
                onMicPressed:() {
                  voiceController.toggleListening(
                    controller.descriptionController,
                    voiceController.isListeningFeedback, // Pass specific isListening state
                  );
                }, isListening: isListening,),
              SizedBox(height: 20,),
              CustomButton(text: "submit".tr, onPressed: ()=> controller.submitReport()
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/help_report_controller.dart';
//
// class HelpReportView extends StatelessWidget {
//   final HelpReportController controller = Get.put(HelpReportController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Submit Help Report")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Subject", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             TextField(controller: controller.subjectController, decoration: InputDecoration(hintText: "Enter subject")),
//
//             SizedBox(height: 16),
//             Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             TextField(controller: controller.descriptionController, maxLines: 3, decoration: InputDecoration(hintText: "Enter description")),
//
//             SizedBox(height: 16),
//             Text("Select Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//
//
//             SizedBox(height: 20),
//             Obx(() => ElevatedButton(
//               onPressed: controller.isLoading.value ? null : controller.submitReport,
//               child: controller.isLoading.value
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text("Submit Report"),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
