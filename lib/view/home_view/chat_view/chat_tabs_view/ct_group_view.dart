import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/app_images.dart';
import '../../../../res/commonWidget/customText.dart';
import 'chat_box_view.dart';

class CTGroupView extends StatelessWidget {
  const CTGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?dfghjkl;'\';lkjhgfdssdfghjkll",
              "Just now",
              AppImages.marcus,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.catherine,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.hanna,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.alisha,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.alishadoe,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.hanna1,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.livia,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
            _tileCard(
              "Randy Stanton",
              "This is the demo text for the message?",
              "Just now",
              AppImages.randy,
              size,
                  () {
                Get.to(CTChatBoxView());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _tileCard(
      String titleTxt,
      String desPTxt,
      String desSTxt,
      String imgPath,
      Size size,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray100, // Border color
            width: 1.0, // Optional: border width
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imgPath),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: titleTxt,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                title: desSTxt,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          subtitle: CustomText(
            title: desPTxt,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Container(
            padding: EdgeInsets.all(4.sp),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(size.width / 2),
            ),
            child: CustomText(
              title: "12",
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
