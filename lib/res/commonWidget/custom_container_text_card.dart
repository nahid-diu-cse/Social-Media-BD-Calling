import 'package:flutter/cupertino.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/customStyle/customText.dart';

class CustomContainerTextCard extends StatelessWidget {
  const CustomContainerTextCard({
    super.key,
    this.height,
    this.width,
    required this.text,
    this.textColor,
    this.fontSize,
    this.border,
    this.cardColor,
    this.borderRadius,
  });

  final double? height;
  final double? width;
  final String text;
  final Color? textColor;
  final Color? cardColor;
  final double? fontSize;
  final Border? border;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 30,
      width: width ?? 73,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        color: cardColor ?? AppColors.mainColor,
        border: border,
      ),
      child: Center(
        child: CustomText(
          title: text,
          color: textColor ?? AppColors.bgColor,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
