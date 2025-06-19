import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/profile_view/setting_view/security_password_view.dart';

import 'help_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  bool isSwitchOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
               // Get.to(()=>HelpView());
              },
              child: ListTile(
                leading: Image.asset(AppImages.account, height: 24, width: 24),
                title: CustomText(
                  title: "Account",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: CustomText(
                  title: "Privacy, Change Number ",
                  fontWeight: FontWeight.w500,
                  color: AppColors.black100,
                  fontSize: 13,
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 20),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){
                Get.to(()=>SecurityPasswordView());
              },
              child: ListTile(
                 leading: Image.asset(AppImages.security, height: 24, width: 24),
                title: CustomText(
                  title: "Security",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: CustomText(
                  title: "Change Number",
                  fontWeight: FontWeight.w500,
                  color: AppColors.black100,
                  fontSize: 13,
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 20),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications_none,size: 24,),
              title: CustomText(
                title: "Notification",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              subtitle: CustomText(
                title: "Message, group, ringtone",
                fontWeight: FontWeight.w500,
                color: AppColors.black100,
                fontSize: 13,
              ),
              trailing: Switch(
                value: isSwitchOn,
                onChanged: (newValue) {
                  setState(() {
                    isSwitchOn = newValue;
                  });
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.red,
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.white,
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){
                Get.to(()=>HelpView());
              },

              child: ListTile(
                leading: Icon(Icons.help_outline_rounded,size: 24,),
                title: CustomText(
                  title: "Help",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: CustomText(
                  title: "Help center, contact us, privacy policy ",
                  fontWeight: FontWeight.w500,
                  color: AppColors.black100,
                  fontSize: 13,
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
