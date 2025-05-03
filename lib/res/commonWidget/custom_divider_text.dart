import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';

class CustomDividerText extends StatelessWidget {
  const CustomDividerText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey, endIndent: 10),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColors.black100,
          ),
        ),
        Expanded(
          child: Divider(thickness: 1, color: Colors.grey, endIndent: 10),
        ),
      ],
    );
  }
}
