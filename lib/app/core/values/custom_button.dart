import 'package:family_planning/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double fontSize;
  final Widget? icon;
  final bool isLoading;
  final String? snackbarMessage; // <-- new

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.appColor,
    this.textColor = Colors.white,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    this.fontSize = 16.0,
    this.isLoading = false,
    this.snackbarMessage, // <-- new
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
          onPressed(); // original logic
          if (snackbarMessage != null && snackbarMessage!.isNotEmpty) {
            Get.snackbar(
              "Info", snackbarMessage!,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.black87,
              colorText: Colors.white,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

