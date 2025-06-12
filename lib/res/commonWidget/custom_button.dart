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
    this.height = 46,
    this.width = double.infinity,
    this.textColor,
    this.prefixIcon,
    this.prefixAssetIcon,
    this.prefixIconSize = 24.0,
    this.prefixIconColor,
    this.prefixAssetIconColor,
    this.isLoading = false, // <- Added
  });

  final Border? border;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? cardColor;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? prefixAssetIcon;
  final double prefixIconSize;
  final Color? prefixIconColor;
  final Color? prefixAssetIconColor;
  final bool isLoading; // <- Added

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap, // Disable tap when loading
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: border,
          color: cardColor ?? AppColors.mainColor,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                textColor ?? color ?? Colors.white,
              ),
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null) ...[
                prefixIcon!,
                SizedBox(width: 8),
              ],
              if (prefixAssetIcon != null) ...[
                prefixAssetIcon!,
                SizedBox(width: 8),
              ],
              CustomText(
                title: title,
                fontSize: fontSize ?? 15,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: textColor ?? color ?? Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
