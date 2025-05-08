import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/create_chat_group_view.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/ct_group_view.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/ct_personal_view.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/ct_request_view.dart';

import '../../../res/commonWidget/custom_text_field.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 15.sp),
        ),
        title: CustomText(
          title: "Chat",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(CreateChatGroupView());
            },
            icon: Center(
              child: Image.asset(AppImages.plus, height: 20.sp, width: 20.sp),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Search chat and messages',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              width: double.infinity,
              filled: true,
              // Optional: enables background color
              fillColor: AppColors.whiteShade1,
              borderColor: Colors.grey.shade200,
              borderWidth: 1,
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    // Tab Bar
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: AppColors.gray500,
                      indicatorColor: AppColors.mainColor,
                      tabs: const [
                        Tab(text: 'Personal'),
                        Tab(text: 'Group'),
                        Tab(text: 'Requests'),
                      ],
                    ),

                    // Tab Bar View
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Personal Tab
                          CTPersonalView(),

                          // Group Tab
                          CTGroupView(),

                          CTRequestView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
