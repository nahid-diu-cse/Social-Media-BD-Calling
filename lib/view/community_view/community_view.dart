import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:social_media/view/community_view/community_profile_view.dart';
import 'package:social_media/view/community_view/search_view/search_view.dart';

import '../../res/appColors/app_colors.dart';
import '../../res/appImage/app_images.dart';
import '../../res/commonWidget/customText.dart';
import 'new_community_view/new_community_view.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {

  final List<Map<String, dynamic>> groupList = [
    {
      'title': "Porsche 911 Owners",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.porsche,
    },
    {
      'title': "Tech Innovators",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.apple,
    },
    {
      'title': "Laguna Beach",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.porsche,
    },
    {
      'title': "BMW M Series",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.apple,
    },
    {
      'title': "Stanford University",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.porsche,
    },
    {
      'title': "Mercedes W140 Owners",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.apple,
    },
    {
      'title': "Laguna Beach",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.porsche,
    },
    {
      'title': "BMW M Series",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.apple,
    },
    {
      'title': "Stanford University",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.porsche,
    },
    {
      'title': "Mercedes W140 Owners",
      'members': "220 Members",
      'privacy': "Private",
      'image': AppImages.apple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(color: AppColors.bgColor),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: "Community",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gray50,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Center(
                            child: Image.asset(
                              AppImages.notification,
                              height: 20.w,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gray50,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(SearchView());
                          },
                          icon: Center(
                            child: Image.asset(
                              AppImages.search,
                              height: 16.w,
                              width: 16.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gray50,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => NewCommunityView());
                          },
                          icon: Center(
                            child: Image.asset(
                              AppImages.plus,
                              height: 22.w,
                              width: 22.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "23 COMMUNITIES JOINED",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: groupList.length,
                  itemBuilder: (context, index) {
                    final group = groupList[index];
                    return _tileCard(
                      group['title'],
                      group['members'],
                      group['privacy'],
                      group['image'],
                          () {
                        Get.to(()=>CommunityProfileView());
                      },
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

  Widget _tileCard(
      String titleTxt,
      String desPTxt,
      String desSTxt,
      String imgPath,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray100,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Image.asset(imgPath),
          title: CustomText(
            title: titleTxt,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          subtitle: Row(
            children: [
              CustomText(
                title: desPTxt,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
              SizedBox(width: 5.w),
              CustomText(
                title: desSTxt,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
        ),
      ),
    );
  }
}
