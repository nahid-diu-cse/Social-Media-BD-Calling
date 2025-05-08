import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/chat_box_profile_view.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/App_images.dart';
import '../../../../res/commonWidget/custom_text_field.dart';
import '../../../../res/customStyle/customText.dart';

class CTChatBoxView extends StatefulWidget {
  const CTChatBoxView({super.key});

  @override
  State<CTChatBoxView> createState() => _CTChatBoxViewState();
}

class _CTChatBoxViewState extends State<CTChatBoxView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        title: InkWell(
          onTap: ()=>Get.to(ChatBoxProfileView()),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppImages.profile),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Hanna Levin",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    title: "hennyjen",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Center(
              child: Image.asset(AppImages.video, height: 14.sp, width: 20.sp),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Center(
              child: Image.asset(AppImages.call, height: 16.sp, width: 18.sp),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: size.width,
            decoration: BoxDecoration(color: AppColors.lightBgColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock, color: AppColors.darkGray, size: 12),
                    CustomText(
                      title: "End to end encrypted",
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                CustomText(
                  title:
                      "Messages and calls are secured with end-to-end encryption.",
                  style: TextStyle(fontSize: 11, color: AppColors.gray500),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          CustomText(
            title: "Today, 4:27 PM",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
          ),

          // Expandable middle area for chat messages (future-proof)
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: CustomText(
                  title: "No messages yet.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Divider(),
          // Input row (chat search or message input)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.plus,
                    width: 18.sp,
                    height: 18.sp,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Send a messages',
                    suffixIcon: Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                  ),
                ),
                IconButton(onPressed: (){}, icon: Image.asset(AppImages.camera)),
                IconButton(onPressed: (){}, icon: Image.asset(AppImages.microphone)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
