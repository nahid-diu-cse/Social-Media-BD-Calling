import 'package:custom_text_field_with_drop_down/custom_text_field_with_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/customStyle/customText.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black100,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 38),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(AppImages.forget)],
                ),
                SizedBox(height: 32),
                CustomText(
                  title:
                      "Please enter your email address which wasused to create your account ",
                  textAlign: TextAlign.center,
                  color: AppColors.black100,
                  fontSize: 16,
                  maxLines: 2,
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      title: "Email",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFormField(hintText: "Enter your email address..."),
                SizedBox(height: 24),
                CustomButton(title: "Next",
                    fontSize: 16,
                    color: AppColors.bgColor,
                    onTap: (){})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
