import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/view/community_view/new_community_view/nc_invite_members_view.dart';

import '../../../res/appImage/App_images.dart';
import '../../../res/commonWidget/custom_text_field.dart';
import '../../../res/commonWidget/customText.dart';

class NewCommunityView extends StatefulWidget {
  NewCommunityView({super.key});

  @override
  State<NewCommunityView> createState() => _NewCommunityViewState();
}

class _NewCommunityViewState extends State<NewCommunityView> {
  final List<String> options = ["Public", "Private", "Invite Only"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "New Community", actions: []),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: width * .15,
                backgroundImage: AssetImage(AppImages.profile),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: CustomText(
                  title: 'Update image',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.mainColor),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextField(
              hintText: 'Name of your community',
              borderColor: Colors.grey.shade200,
              borderWidth: 1,
            ),
            SizedBox(height: 25.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: 'Privacy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 5.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(2),
                // Padding inside the whole toggle group
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(options.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        // Spacing between buttons
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.mainColor
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow:
                              isSelected
                                  ? [
                                    BoxShadow(
                                      color: AppColors.mainColor.withOpacity(
                                        0.2,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                  : [],
                        ),
                        child: Text(
                          options[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color:
                                isSelected
                                    ? Colors.white
                                    : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: height*.05 ),
            CustomButton(title: "Continue", onTap: (){
              Get.to(()=>NCInviteMembersView());
            })
          ],
        ),
      ),
    );
  }
}
