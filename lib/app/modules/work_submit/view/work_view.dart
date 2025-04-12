
import 'package:avatar_glow/avatar_glow.dart';
import 'package:family_planning/app/core/values/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/image_picker.dart';
import '../../../core/values/location_map_controller.dart';
import '../../../core/values/text_styles.dart';

import '../../../data/model/work_type_model.dart';
import '../controller/controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../widgets/work_summary.dart';


class WorkScreen extends StatelessWidget {
  final WorkController controller = Get.put(WorkController());

   WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("activities".tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('date'.tr, style: titleTextBlue16),
              const SizedBox(height: 8,),
              Obx(() => Container(
                color: Colors.white,
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: controller.selectedDate.value.isNotEmpty
                        ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(controller.selectedDate.value),
                    )
                        : const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'তারিখ নির্বাচন করুন',
                        style: grayTitleText14,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.appColor,
                      ),
                      onPressed: () => controller.pickDate(context),
                      tooltip: 'Open date picker',
                    ),
                  ),
                ),
              )),
              const SizedBox(height: 16,),
              WorkTypeDropdown(),
              WorkForm(),
              const SizedBox(height: 20,),

               CustomButton(text:'summary'.tr,onPressed:(){
                Get.to(()=> WorkFormSummaryScreen());})

            ],
          ),
        ),
      ),
    );
  }
}
class WorkTypeDropdown extends StatelessWidget {
  final WorkController controller = Get.put(WorkController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('work_type'.tr, style: titleTextBlue16),
        const SizedBox(height: 8,),
        Obx(() {
          return DropdownButtonFormField<int>(
            isExpanded: true,
            decoration: InputDecoration(

              contentPadding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 16),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            hint: const Text('আইটেম নির্বাচন করুন',style: TextStyle(fontFamily: "AnekBangla") ,),style:grayTitleText14 ,
            value: controller.selectedWorkTypeId.value,
            items: controller.workTypes.map((workType) {
              return DropdownMenuItem<int>(
                value: workType.workTypeId,
                child: Text(workType.workType,style: const TextStyle(fontFamily: "AnekBangla",color: Colors.black87, fontSize: 16),),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                controller.fetchWorkFields(value);
              }
            },
          );
        }),
      ],
    );
  }
}


class WorkForm extends StatefulWidget {
  @override
  _WorkFormState createState() => _WorkFormState();
}

class _WorkFormState extends State<WorkForm> {
  final WorkController controller = Get.find();
  final LocationController locationController = Get.put(LocationController());
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _speechEnabled = false;
  Map<int, bool> _isListeningMap = {};
  Map<int, String> _recordedText = {};

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speech.initialize(
      onError: (error) {
        debugPrint('Speech init error: $error');
      },
      onStatus: (status) {
        debugPrint('Speech status: $status');
      },
    );
    setState(() {});
  }

  void _startListening(int fieldId) async {
    if (_speechEnabled) {
      setState(() {
        _isListeningMap[fieldId] = true;
      });
      await _speech.listen(
        onResult: (result) {
          setState(() {
            _recordedText[fieldId] = result.recognizedWords;
            controller.fieldValues[fieldId] = result.recognizedWords;
          });

          if (result.finalResult) {
            _stopListening(fieldId); // Auto stop when recognition is done
          }
        },
        listenFor: const Duration(seconds: 10),
       listenOptions: stt.SpeechListenOptions(cancelOnError: true,partialResults: true),

        localeId: 'bn_BD', // for Bangla speech recognition
      );
    }
  }


  void _stopListening(int fieldId) async {
    await _speech.stop();
    setState(() {
      _isListeningMap[fieldId] = false;
    });
  }

  @override
  void dispose() {
    _speech.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: controller.workFields.map((field) {
          if (field.fieldType == "text") {
            return buildTextField(field);
          } else if (field.fieldType == "image") {
            return buildImageField(field);
          } else if (field.fieldType == "dropdown") {
            return buildDropdownField(field);
          } else if (field.fieldType == "location") {
            return buildLocationField(field);
          }
          return const SizedBox.shrink();
        }).toList(),
      );
    });
  }

  Widget buildTextField(WorkField field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text("${field.field}", style: titleTextBlue16),
        const SizedBox(height: 8,),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  controller.fieldValues[field.fieldId] = value;
                  _recordedText[field.fieldId] = value;
                },
                controller: TextEditingController(
                  text: _recordedText[field.fieldId] ?? '',
                )..selection = TextSelection.collapsed(
                  offset: (_recordedText[field.fieldId] ?? '').length,
                ),
                decoration: inputDecoration().copyWith(
                  hintText: 'এখানে লেখুন...',hintStyle: grayTitleText14
                ),
              ),
            ),
            const SizedBox(width: 6,),
            AvatarGlow(
              duration: const Duration(milliseconds: 1000),
              animate: _isListeningMap[field.fieldId] == true ? true : false,
              glowColor: AppColors.appColor.withOpacity(0.2),
              child: Container(
                height: 50,decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(10)),
                width: 50,
                child: IconButton(
                  icon: Icon(
                    _isListeningMap[field.fieldId] == true ? Icons.mic : Icons.mic_none,
                    color: _isListeningMap[field.fieldId] == true ? Colors.red : AppColors.appColor,
                  ),
                  onPressed: () {
                    if (_isListeningMap[field.fieldId] == true) {
                      _stopListening(field.fieldId);
                    } else {
                      _startListening(field.fieldId);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildLocationField(WorkField field) {
    return Obx(() {
      controller.fieldValues[field.fieldId] = locationController.address.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text("${field.field}", style: titleTextBlue16),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Text(
                    locationController.isLoading.value
                        ? "Fetching location..."
                        : locationController.address.value.isNotEmpty
                        ? locationController.address.value
                        : "Location not available",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.appColor),
                onPressed: () async {
                  await locationController.getLocation();
                  controller.fieldValues[field.fieldId] = locationController.address.value;
                },
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget buildImageField(WorkField field) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text("${field.field}", style: titleTextBlue16),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.imagePaths.containsKey(field.fieldId)
                  ? ImagePickerBox(
                image: XFile(controller.imagePaths[field.fieldId]!),
                onTap: () {
                  controller.openCameraAndCrop(field.fieldId);
                },
              )
                  : PlaceholderImage(field),

            ],
          ),
        ],
      );
    });
  }

  Widget buildDropdownField(WorkField field) {
    List<String> dropdownItems = field.dropdownMenu.split(",");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(field.field, style: titleTextBlue16),
        DropdownButtonFormField<String>(
          hint: Text(field.field ,style: grayTitleText14),
          decoration: inputDecoration(),
          items: dropdownItems.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            controller.fieldValues[field.fieldId] = value!;
          },
        ),
      ],
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget PlaceholderImage(field) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(borderRadius:  BorderRadius.circular(12), color: Colors.grey.shade200,),
      child:    GestureDetector(
        child: const Icon(Icons.camera_enhance_outlined, size: 50, color: AppColors.appColor),
        onTap: () {
          controller.openCameraAndCrop(field.fieldId);
        },
      ),
    );
  }
}

