import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.border,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.color,
    required this.onTap,
    this.cardColor,
  });

  final Border? border;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? cardColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: border,
          color: cardColor ?? AppColors.mainColor,
        ),
        child: Center(
          child: CustomText(
            title: title,
            fontSize: fontSize ?? 15,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
