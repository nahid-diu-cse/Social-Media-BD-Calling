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
    this.height = 46, // Default height
    this.width = double.infinity, // Default width
    this.textColor, // Flexible text color
    this.prefixIcon, // Flexible prefix icon (Icon widget)
    this.prefixAssetIcon, // Flexible prefix asset icon (image)
    this.prefixIconSize = 24.0, // Default size for prefix icon
    this.prefixIconColor, // Color for the prefix Icon
    this.prefixAssetIconColor, // Color (tint) for the prefix asset icon
  });

  final Border? border;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? cardColor;
  final VoidCallback onTap;
  final double height; // Flexible height
  final double width;  // Flexible width
  final Color? textColor; // Flexible text color
  final Widget? prefixIcon; // Flexible prefix icon (Icon widget)
  final Widget? prefixAssetIcon; // Flexible prefix asset icon (Image widget)
  final double prefixIconSize; // Size for the icon or asset icon
  final Color? prefixIconColor; // Color for the prefix Icon
  final Color? prefixAssetIconColor; // Color (tint) for the prefix asset icon

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height, // Use the flexible height
        width: width,  // Use the flexible width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: border,
          color: cardColor ?? AppColors.mainColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // If prefixIcon (Widget) is provided, display it
              if (prefixIcon != null) ...[
                prefixIcon!,
                SizedBox(width: 8), // Add space between icon and text
              ],
              // If prefixAssetIcon (Widget) is provided, display it
              if (prefixAssetIcon != null) ...[
                prefixAssetIcon!,
                SizedBox(width: 8), // Add space between icon and text
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
