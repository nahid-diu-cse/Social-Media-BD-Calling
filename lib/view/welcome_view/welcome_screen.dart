import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/customStyle/customText.dart';
import 'package:social_media/view/authentication_view/createAccount_view/view/createAccount_view.dart';
import 'package:social_media/view/authentication_view/logIn_view/view/login_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Welcome to ONE Net",
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: AppColors.black100,
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomText(
                title:
                    "Connect, share, and explore a world of endless possibilities. Build relationships, share your ideas, and be part of a vibrant, inclusive community, Let's make every moment count! 🚀",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                textAlign: TextAlign.center,
                color: AppColors.black100,
                maxLines: 4,
              ),
              SizedBox(height: 80),
              Image.asset(AppImages.splashBg, height: 40, width: 200),
              SizedBox(height: 80),
              CustomButton(
                title: "Log In",
                fontSize: 16,
                onTap: () {
                  Get.to(() => LoginView());
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Create an Account",
                color: AppColors.black100,
                cardColor: Colors.white,
                border: Border.all(color: AppColors.black100),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                onTap: () {
                  Get.to(() => CreateAccountView());
                },
              ),
              SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "By signing up you confirm that you have read & agree to the \nour ",
                      style: TextStyle(color: AppColors.black33, fontSize: 14),
                    ),
                    TextSpan(
                      text: "Privacy Policy and Terms & conditions",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}