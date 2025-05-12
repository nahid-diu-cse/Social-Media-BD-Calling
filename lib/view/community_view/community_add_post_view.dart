import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';

class CommunityAddPostView extends StatelessWidget {
  const CommunityAddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "New Post",
        actions: [
          InkWell(
            child: CustomText(
              title: "Post",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.profile, width: 35.w, height: 35.h),
            SizedBox(width: 10.w), // spacing between image and text field
            Expanded(
              child: TextField(
                maxLines: 6, // allows up to 5 lines
                minLines: 1, // starts with 1 line and grows
                decoration: InputDecoration(
                  hintText: "Type here...",
                  isDense: true,
                  border: InputBorder.none, // removes border
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
