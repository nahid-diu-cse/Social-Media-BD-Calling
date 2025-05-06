import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';
import 'package:social_media/view/setting_view/about_us_view.dart';
import 'package:social_media/view/setting_view/privacy_policy_view.dart';
import 'package:social_media/view/setting_view/teams_service_view.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Helps",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => TeamsServiceView());
            },
            child: ListTile(
              leading: Image.asset(AppImages.listbook, height: 24, width: 24),
              title: CustomText(
                title: "Terms of Services",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Get.to(() => PrivacyPolicyView());
            },
            child: ListTile(
              leading: Image.asset(AppImages.privacy, height: 24, width: 24),
              title: CustomText(
                title: "Privacy Policy",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: (){
              Get.to(()=>AboutUsView());
            },
            child: ListTile(
              leading: Image.asset(
                AppImages.support,
                height: 24,
                width: 24,
                color: AppColors.black33,
              ),
              title: CustomText(
                title: "About Us",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
