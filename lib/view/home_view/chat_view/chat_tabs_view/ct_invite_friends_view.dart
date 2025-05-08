import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/App_images.dart';
import '../../../../res/commonWidget/custom_text_field.dart';
import '../../../../res/customStyle/customText.dart';

class CTInviteFriendsView extends StatefulWidget {
  const CTInviteFriendsView({super.key});

  @override
  State<CTInviteFriendsView> createState() => _CTInviteFriendsViewState();
}

class _CTInviteFriendsViewState extends State<CTInviteFriendsView> {
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
          title: "Invite to Chat",
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
            ),
            ListTile(
              leading: Image.asset(AppImages.chain,width: 20.w,height: 20.h,),
              title: CustomText(
                title: "Invite Link",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              subtitle: CustomText(
                title: "https://m.me/slfghjddffg",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              trailing:OutlinedButton(
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
                  'Copy',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 3),
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
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: isSelected
                                    ? Icon(Icons.check, size: 14, color: Colors.white)
                                    : null,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 3),
                          ),
                          if (index < members.length - 1)
                            Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
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
