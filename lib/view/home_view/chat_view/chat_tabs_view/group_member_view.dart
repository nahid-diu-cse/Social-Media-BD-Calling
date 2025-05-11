import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/commonWidget/custom_text_field.dart';
import '../../../../res/commonWidget/customText.dart';
import '../../../../res/appImage/app_images.dart'; // Make sure this contains your asset image paths

class GroupMemberView extends StatelessWidget {
  GroupMemberView({super.key});

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
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        title: CustomText(
          title: "Members",
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
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
                        trailing:
                            member['isAdmin']
                                ? OutlinedButton(
                                  onPressed: () {
                                    // Your logic for "Invite" button here
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.gray100,
                                    side: BorderSide.none,
                                    // Removes the border
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 4,
                                    ),
                                    minimumSize: Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Admin',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                                : null,
                        contentPadding: EdgeInsets.symmetric(vertical: 3),
                      ),
                      // Add divider after each item except the last one
                      if (index < members.length - 1)
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                    ],
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
