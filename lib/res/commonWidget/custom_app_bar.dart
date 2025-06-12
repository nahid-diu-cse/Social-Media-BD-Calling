import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double? elevation;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor, // Now nullable
    this.elevation = 4.0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        title: title??"",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.black, // You can make this dynamic based on theme if needed
        ),
      ),
      centerTitle: true,
      // elevation: elevation,
      backgroundColor: backgroundColor, // Will only apply if not null
      leading: leading ??
          InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(Icons.arrow_back_ios, size: 15.sp, color: Colors.black),
            ),
          ),
      actions: actions != null
          ? [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: actions!,
          ),
        )
      ]
          : null,

    );
  }
}
