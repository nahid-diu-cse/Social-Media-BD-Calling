import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';

import '../../res/commonWidget/customText.dart';

class CommunityAnnouncementsView extends StatelessWidget {
  CommunityAnnouncementsView({super.key});

  final List<Map<String, dynamic>> messages = [
    {
      'username': 'Marcuskraken',
      'time': 'Yesterday at 7:44 PM',
      'content':
      'Welcome to the Community Chat! Feel free to introduce yourself and connect with others. Let\'s keep the discussion fun, friendly, and respectful!',
      'isAdmin': true,
      'image': AppImages.profile1,
    },
    {
      'username': 'Makkyl\'lussin',
      'time': 'Yesterday at 7:44 PM',
      'content':
      'Hey everyone! Just joined this amazing community. Excited to be here! What\'s the best advice you\'ve received from this group so far?',
      'isAdmin': false,
      'image': AppImages.profile,
    },
    {
      'username': 'JohnDoe',
      'time': 'Yesterday at 7:44 PM',
      'content':
      'Good morning, everyone! What\'s one goal you\'re working on today? Let\'s motivate each other!',
      'isAdmin': false,
      'image': AppImages.randy,
    },
    {
      'username': 'Roman',
      'time': 'Yesterday at 7:44 PM',
      'content':
      'What\'s one app or tool you can\'t live without? Let\'s share our favorites!',
      'isAdmin': false,
      'image': AppImages.hanna1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Announcements",
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Icon(Icons.search, size: 24.sp),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Image.asset(
              AppImages.plus,
              width: 24.w,
              height: 24.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _time(),
              const SizedBox(height: 16),
              _buildMessageList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _time() {
    return CustomText(
      title: 'Today, 4:27 PM',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      separatorBuilder: (context, index) => const Divider(height: 24),
      itemBuilder: (context, index) {
        final message = messages[index];
        return _buildMessageItem(
          username: message['username'],
          time: message['time'],
          content: message['content'],
          isAdmin: message['isAdmin'] ?? false,
          image: message['image'], // pass image dynamically
        );
      },
    );
  }

  Widget _buildMessageItem({
    required String username,
    required String time,
    required String content,
    required bool isAdmin,
    required String image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  width: 40.w,
                  height: 40.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: username,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: time,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          if (isAdmin) _buildAdminBadge(),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        title: content,
                        style: TextStyle(
                          color: AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdminBadge() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const CustomText(
        title: 'Admin',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
