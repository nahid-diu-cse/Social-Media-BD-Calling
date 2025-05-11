import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../res/appImage/app_images.dart';
import '../../../../res/commonWidget/custom_text_field.dart';
import '../../../res/commonWidget/customText.dart';
import '../../buttom_navi_bar_view/buttom_navi_bar_view.dart';

class NCInviteMembersView extends StatefulWidget {
  const NCInviteMembersView({super.key});

  @override
  State<NCInviteMembersView> createState() => _NCInviteMembersViewState();
}

class _NCInviteMembersViewState extends State<NCInviteMembersView> {
  final List<Map<String, dynamic>> members = [
    {
      'image': AppImages.profile,
      'name': 'Hanna Levin',
      'isAdmin': true,
      'isSelected': false,
    },
    {
      'image': AppImages.livia,
      'name': 'John Smith',
      'isAdmin': false,
      'isSelected': false,
    },
    {
      'image': AppImages.profile,
      'name': 'Emily Clark',
      'isAdmin': false,
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final bool isAnySelected = members.any((m) => m['isSelected'] == true);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Invite to Chat",
        actions: [
          TextButton(
            onPressed: () {
              Get.to(()=>ButtomNaviBarView());
            },
            child: CustomText(
              title: "Send",
              style: TextStyle(
                color: isAnySelected
                    ? AppColors.mainColor
                    : AppColors.darkHover,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Write a message',
              borderColor: Colors.grey.shade200,
              borderWidth: 2,
            ),
            SizedBox(height: height * .01),
            CustomTextField(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              borderColor: AppColors.gray100,
              borderWidth: 2,
            ),
            SizedBox(height: 25.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: 'Suggested Friends',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        members[index]['isSelected'] =
                        !members[index]['isSelected'];
                      });
                    },
                    child: Column(
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
                          trailing: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: member['isSelected']
                                  ? AppColors.mainColor
                                  : Colors.transparent,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: member['isSelected']
                                ? Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                                : null,
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 3),
                        ),
                        if (index < members.length - 1)
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                      ],
                    ),
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
