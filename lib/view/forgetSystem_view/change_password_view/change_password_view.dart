import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/authentication_view/login_view.dart';
import 'package:social_media/view_model/auth_controller/forget_password_controller.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  ForgetPasswordController forgetPasswordController = Get.put(
    ForgetPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(fontSize: 18, color: AppColors.black100),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: Get.back,
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(AppImages.changepassword)],
              ),
              SizedBox(height: 32),
              CustomText(
                title:
                    "Please create and enter a new password \nfor your account",
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
              SizedBox(height: 10),
              CustomTextFormField(
                controller: forgetPasswordController.passwordController.value,
                hintText: "Enter Password",
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomText(
                    title: "New Password",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                controller:
                    forgetPasswordController.confirmPasswordController.value,
                hintText: "Enter confirm Password",
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Next",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                onTap: () {
                  forgetPasswordController.resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
