import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/customStyle/customText.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(fontSize: 18, color: AppColors.black100),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 38),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AppImages.changepassword)],
            ),
            SizedBox(height: 32),
            CustomText(
              title: "Please create and enter a new password \nfor your account",
              textAlign: TextAlign.center,
              fontSize: 18,
              color: AppColors.black100,
            ),
            SizedBox(height: 32),
            Row(
              children: [
                CustomText(
                  title: "New Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
