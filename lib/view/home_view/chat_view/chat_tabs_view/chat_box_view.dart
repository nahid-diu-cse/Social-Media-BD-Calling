import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/chat_box_profile_view.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/app_images.dart';
import '../../../../res/commonWidget/custom_text_field.dart';
import '../../../../res/commonWidget/customText.dart';

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

          // // Expandable middle area for chat messages (future-proof)
          // Expanded(
          //   child: Container(
          //     color: Colors.transparent,
          //     child: Center(
          //       child: CustomText(
          //         title: "No messages yet.",
          //         style: TextStyle(color: Colors.grey),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _timestamp("Today, 4:27 PM"),
                _incomingMessage("Hey!!", avatar: true),
                _incomingMessage("How’s it going?"),
                _outgoingMessage("All good, wbu?", seen: true, time: "Seen 4:30 PM"),
                _timestamp("Today, 8:00 PM"),
                _incomingMessage("Not Bad"),
                _incomingMessage("Did you see this?"),
                _incomingImageMessage(AppImages.alishadoe),
              ],
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



  Widget _timestamp(String time) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          time,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }

  Widget _incomingMessage(String text, {bool avatar = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (avatar)
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(AppImages.alisha),
          )
        else
          const SizedBox(width: 32),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(text),
          ),
        ),
      ],
    );
  }

  Widget _outgoingMessage(String text, {String? time, bool seen = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        if (time != null)
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 8),
            child: Text(
              time,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ),
      ],
    );
  }

  Widget _incomingImageMessage(String imagePath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(AppImages.alisha),
        ),
        const SizedBox(width: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
              const Icon(
                Icons.play_circle_outline,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
