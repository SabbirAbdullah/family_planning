import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceController extends GetxController {
  final SpeechToText speechToText = SpeechToText();

  // TextEditingControllers for the fields
  final TextEditingController couplePhoneNumController = TextEditingController();
  final TextEditingController coupleNameController = TextEditingController();
  final TextEditingController husbandNameController = TextEditingController();
  final TextEditingController attendanceDetailController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController shortAddressController = TextEditingController();
  final TextEditingController leaveDetailController= TextEditingController();
  final TextEditingController feedbackController= TextEditingController();




  // Separate isListening states for each field
  final RxBool isListeningPhoneNum = false.obs;
  final RxBool isListeningCouplePhoneNum = false.obs;
  final RxBool isListeningShortAddress = false.obs;
  final RxBool isListeningCoupleName = false.obs;
  final RxBool isListeningHusbandName = false.obs;
  final RxBool isListeningAttendanceDetail = false.obs;
  final RxBool isListeningLeaveDetail = false.obs;
  final RxBool isListeningFeedback = false.obs;
  final RxBool isListeningAttendDesController = false.obs;

  // Recognized text observable (optional, if you want to show results in real-time)
  final RxString recognizedText = ''.obs;

  void startListening(TextEditingController controller, RxBool isListening) async {
    bool available = await speechToText.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      isListening.value = true; // Update the mic's isListening state
      speechToText.listen(
        onResult: (result) {
          recognizedText.value = result.recognizedWords;
          controller.text = recognizedText.value; // Update the field with recognized text
        },
        localeId: 'bn_BD', // Set language to Bangla (Bangladesh)
      );
    }
  }

  void stopListening(RxBool isListening) {
    speechToText.stop();
    isListening.value = false; // Update the mic's isListening state
  }

  void toggleListening(TextEditingController controller, RxBool isListening) {
    if (isListening.value) {
      // If currently listening, stop listening
      stopListening(isListening);
    } else {
      // If not listening, start listening for this mic
      startListening(controller, isListening);
    }
  }
}
