import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class CustomContainerTextCard extends StatelessWidget {
  CustomContainerTextCard({
    super.key,
    this.height = 35,
    this.width,
    required this.text,
    this.textColor,
    this.fontSize,
    this.border,
    this.cardColor,
    this.borderRadius,
    this.onTap,
    this.isLoading, // <-- Add this line
  });

  final double? height;
  final double? width;
  final String text;
  final Color? textColor;
  final Color? cardColor;
  final double? fontSize;
  final Border? border;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool? isLoading; // <-- Add this line

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 30,
        width: width ?? 73,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(15),
          color: cardColor ?? AppColors.mainColor,
          border: border,
        ),
        child: Center(
          child: isLoading == true
              ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                textColor ?? AppColors.bgColor,
              ),
            ),
          )
              : CustomText(
            title: text,
            color: textColor ?? AppColors.bgColor,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
