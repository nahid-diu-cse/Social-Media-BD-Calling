import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/App_images.dart';
import '../../../../res/commonWidget/custom_text_field.dart';
import '../../../../res/customStyle/customText.dart';

class CreateChatGroupView extends StatelessWidget {
  CreateChatGroupView({super.key});

  final List<Map<String, dynamic>> members = [
    {
      'image': AppImages.profile, // replace with real asset
      'name': 'Hanna Levin',
      'isAdmin': true,
    },
    {'image': AppImages.livia, 'name': 'John Smith', 'isAdmin': false},
    {'image': AppImages.profile, 'name': 'Emily Clark', 'isAdmin': false},
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        title: CustomText(
          title: "New Group",
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Search friends',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              width: double.infinity,
              filled: true,
              // Optional: enables background color
              fillColor: AppColors.whiteShade1,
              borderColor: Colors.grey.shade200,
              borderWidth: 1,
            ),
            SizedBox(height: height * .015),
            CustomTextField(
              hintText: 'Group name (optional)',
              width: double.infinity,
              borderColor: Colors.grey.shade200,
              borderWidth: 1,
            ),
            SizedBox(height: height * .01),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "Suggested",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  bool isSelected = false;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 15.r,
                              backgroundImage: AssetImage(member['image']),
                            ),
                            title: CustomText(
                              title: member['name'],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                                // Optional: handle logic on tap
                              },
                              child: Container(
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      isSelected
                                          ? AppColors.primaryColor
                                          : Colors.transparent,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child:
                                    isSelected
                                        ? Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        )
                                        : null,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 3),
                          ),
                          if (index < members.length - 1)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey.shade300,
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
