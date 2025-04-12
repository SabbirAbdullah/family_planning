
import 'package:avatar_glow/avatar_glow.dart';
import 'package:family_planning/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class VoiceInputField extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onMicPressed;
  final RxBool isListening;
  final int? maxLines;
  final VoidCallback? val;

  const VoiceInputField({
    Key? key,
    required this.textController,
    required this.onMicPressed,
    this.val,
    required this.isListening,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextField(
            cursorColor: AppColors.appColor,cursorHeight: 20 ,
            maxLines:maxLines ,
            onChanged: (val){},
            style: formFieldText16,
            controller: textController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 8, top: 8, bottom: 0),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(width: 6,),
        Obx((){return AvatarGlow(
          duration: Duration(milliseconds: 1000),
          animate: isListening.value ? true : false,
          glowColor: AppColors.appColor.withOpacity(0.2),
          child: Container(
            height: 50,width: 50,
            decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(isListening.value ? Icons.mic : Icons.mic_none),
              onPressed: onMicPressed,
            ),
          ),
        );}),

      ],
    );
  }
}

class CheckboxDropdown extends StatelessWidget {
  final String title;
  final bool value;
  final String dropdownValue;
  final List<String> dropdownItems;
  final void Function(bool?) onCheckboxChanged;
  final void Function(String?)onDropdownChanged;

  CheckboxDropdown({
    required this.title,
    required this.value,
    required this.dropdownValue,
    required this.dropdownItems,
    required this.onCheckboxChanged,
    required this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Container(
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderColor)
        ),

        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onCheckboxChanged,
            ),
            Text(title),
            SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: dropdownValue,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: dropdownItems
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                onChanged: onDropdownChanged,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a value';
                  }
                  return null;
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}