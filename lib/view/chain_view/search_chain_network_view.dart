import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_text_field.dart';

import '../../res/commonWidget/customText.dart';

class SearchChainNetworkView extends StatefulWidget {
  SearchChainNetworkView({super.key});

  @override
  State<SearchChainNetworkView> createState() => _SearchChainNetworkViewState();
}

class _SearchChainNetworkViewState extends State<SearchChainNetworkView> {
  // Sample list of chains with title, description, members count, visibility, and button state
  List<Map<String, dynamic>> items = [
    {
      'title': 'Tech Innovators',
      'description': 'Industry leaders in tech innovation',
      'imageUrl': AppImages.blockchain,
      'isJoined': false,
      'membersCount': 220,
      'visibility': 'Public',
    },
    {
      'title': 'Healthcare Innovators',
      'description': 'Innovating healthcare systems for better care',
      'imageUrl': AppImages.blockchain,
      'isJoined': true,
      'membersCount': 220,
      'visibility': 'Private',
    },
    {
      'title': 'Education Innovators',
      'description': 'Revolutionizing education systems worldwide',
      'imageUrl': AppImages.blockchain,
      'isJoined': false,
      'membersCount': 150,
      'visibility': 'Public',
    },
    {
      'title': 'UI UX Designers',
      'description': 'Creative minds shaping user experiences',
      'imageUrl': AppImages.blockchain,
      'isJoined': true,
      'membersCount': 180,
      'visibility': 'Private',
    },
    {
      'title': 'California Folks',
      'description': 'Community of California residents',
      'imageUrl': AppImages.blockchain,
      'isJoined': false,
      'membersCount': 100,
      'visibility': 'Public',
    },
    {
      'title': 'Laguna Beach',
      'description': 'Beach lovers from Laguna',
      'imageUrl': AppImages.blockchain,
      'isJoined': true,
      'membersCount': 120,
      'visibility': 'Private',
    },
    {
      'title': 'AI Experts',
      'description': 'Experts in artificial intelligence',
      'imageUrl': AppImages.blockchain,
      'isJoined': false,
      'membersCount': 300,
      'visibility': 'Public',
    },  
  ];

  void _toggleRequestJoin(int index) {
    setState(() {
      items[index]['isJoined'] = !items[index]['isJoined'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      prefixIcon: Icon(Icons.search),
                      borderRadius: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "Popular Chains",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Row(
                children: [
                  Chip(label: CustomText(title: "People")),
                  SizedBox(width: 8),
                  Chip(label: CustomText(title: "Industry")),
                  SizedBox(width: 8),
                  Chip(label: CustomText(title: "Location")),
                  SizedBox(width: 8),
                  Chip(label: CustomText(title: "School")),
                ],
              ),
              SizedBox(height: 8.h),

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _customListTile(
                      title: items[index]['title'],
                      description: items[index]['description'],
                      imageUrl: items[index]['imageUrl'],
                      isJoined: items[index]['isJoined'],
                      membersCount: items[index]['membersCount'],
                      visibility: items[index]['visibility'],
                      onRequestJoinToggle: () => _toggleRequestJoin(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customListTile({
    required String title,
    required String description,
    required String imageUrl,
    required VoidCallback onRequestJoinToggle,
    required bool isJoined,
    required int membersCount,
    required String visibility,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        leading: Image.asset(
          imageUrl,
          height: 24.h,
          width: 24.w,
          fit: BoxFit.fill,
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          '$membersCount Members • $visibility',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: ElevatedButton(
          onPressed: onRequestJoinToggle,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gray100, // Text color
          ),
          child: Text(
            isJoined ? 'Join' : 'Request',
            style: TextStyle(
              color: isJoined ? AppColors.mainColor : AppColors.gray600,
            ),
          ),
        ),
      ),
    );
  }
}
