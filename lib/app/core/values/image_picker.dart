import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'app_colors.dart';
class ImagePickerBox extends StatelessWidget {
  final XFile? image;
  final VoidCallback onTap;
  final double borderRadius;
  final Color? backgroundColor;

  const ImagePickerBox({
    super.key,
    required this.image,
    required this.onTap,
    this.borderRadius = 12,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.width * 0.6;
    final double width = MediaQuery.of(context).size.width * 0.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: image != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.file(
            File(image!.path),  // Unwrap the nullable image
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        )
            : const Icon(
          Icons.camera_enhance_outlined,
          size: 50,
          color: AppColors.appColor,
        ),
      ),
    );
  }
}
