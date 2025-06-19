import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class ContainerViewCard extends StatelessWidget {
  const ContainerViewCard({
    super.key,
    this.cardColor,
    required this.text,
    this.textColor,
    required this.image,
    this.imagecolor,
    this.border,
    this.width, // Nullable width
  });

  final Color? cardColor;
  final Color? textColor;
  final Color? imagecolor;
  final String text;
  final String image;
  final Border? border;
  final double? width; // Nullable width

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: width ?? 165, // Default width if null
      decoration: BoxDecoration(
        color: cardColor ?? AppColors.mainColor,
        borderRadius: BorderRadius.circular(15),
        border: border,
      ),
      child: Row(
        children: [
          SizedBox(width: 35),
          Image.asset(image, height: 18, width: 18, color: imagecolor),
          CustomText(
            title: text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.white,
          ),
        ],
      ),
    );
  }
}
