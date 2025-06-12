import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_divider_text.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/authentication_view/verification_view.dart';

import 'login_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create Account",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.splashBg, height: 40, width: 200),
                ],
              ),
              SizedBox(height: 40),
              CustomText(
                title: "First Name",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "Enter your first name"),
              SizedBox(height: 10),
              CustomText(
                title: "Last Name",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "Enter your first name"),
              SizedBox(height: 10),
              CustomText(
                title: "Location",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "Enter your location address..."),
              SizedBox(height: 10),
              CustomText(
                title: "Email",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(hintText: "Enter your email address..."),
              SizedBox(height: 10),
              CustomText(
                title: "Password",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "Enter password",
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Confirm Password",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "Enter confirm password",
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: 10),
              CustomButton(
                title: "Sign Up",
                fontSize: 16,
                onTap: () {
                  Get.to(() => VerificationView());
                },
              ),
              SizedBox(height: 32),
              CustomDividerText(text: 'Or continue with'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.black100),
                    ),
                    child: Image.asset(AppImages.google),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 60,
                    width: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.black100),
                    ),
                    child: Image.asset(AppImages.apple),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Already have an account! ",
                    color: AppColors.black100,
                    fontSize: 16,
                  ),
                  CustomText(
                    title: "Log In",
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
