import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:load_switch/load_switch.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/ct_invite_friends_view.dart';
import 'package:social_media/view/home_view/chat_view/chat_tabs_view/group_member_view.dart';

import '../../../../res/appImage/app_images.dart';

class ChatBoxProfileView extends StatefulWidget {
  const ChatBoxProfileView({super.key});

  @override
  State<ChatBoxProfileView> createState() => _ChatBoxProfileViewState();
}

class _ChatBoxProfileViewState extends State<ChatBoxProfileView> {
  late bool value = false;

  Future<bool> _getFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return !value;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        title: CustomText(
          title: "Hanna Levin",
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,

        // Add bottom divider
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: width * .15,
                backgroundImage: AssetImage(AppImages.profile),
              ),
            ),
            SizedBox(height: height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: "Hanna Levin",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5.w),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.edit,
                    color: AppColors.blueDarker,
                    width: 12.w,
                  ),
                ),
              ],
            ),
            CustomText(
              title: "112 Member",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5.h),
            OutlinedButton(
              onPressed: () {
                Get.to(CTInviteFriendsView());
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.gray100,
                side: BorderSide.none,
                // 🔸 Removes border
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4),
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('Invite', style: TextStyle(fontSize: 10)),
            ),
            SizedBox(height: height * .035),
            InkWell(
              onTap: ()=>Get.to(GroupMemberView()),
              child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: width * .035,
                      backgroundImage: AssetImage(AppImages.profile),
                    ),
                    CustomText(
                      title: "See all members",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.arrow_forward_ios, color: AppColors.whiteColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * .015),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.media,
                          height: 12.sp,
                          width: 12.sp,
                          color: AppColors.black100,
                        ),
                        SizedBox(width: 8.w),
                        CustomText(
                          title: "Media, Links & Documents",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black100,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: "152",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black100,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: AppColors.black100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.volume,
                          height: 18.sp,
                          width: 16.sp,
                          color: AppColors.black100,
                        ),
                        SizedBox(width: 8.w),
                        CustomText(
                          title: "Mute Notification",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black100,
                          ),
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: .40, // Increase or decrease for scaling
                      child: LoadSwitch(
                        value: value,
                        future: _getFuture,
                        style: SpinStyle.material,
                        switchDecoration: (value, isLoading) => BoxDecoration(
                          color: value ? AppColors.blueDarkHover: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onChange: (v) {
                          value = v;
                          setState(() {});
                        },
                        onTap: (v) {
                          print('Tapping while value is $v');
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.logout,
                      height: 18.sp,
                      width: 16.sp,
                      color: AppColors.red500,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      title: "Leave Group",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red500,
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
