import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';

import '../../../view_model/controller/auth_controller/forget_password_controller.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final ForgetPasswordController forgetPasswordController = Get.put(
    ForgetPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Forgot Password",),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
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
                        "Please enter your email address which used to create your account ",
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
                  CustomTextFormField(
                    hintText: "Enter your email address...",
                    controller: forgetPasswordController.emailController.value,
                  ),
                  SizedBox(height: 24),
                  Obx(
                    () => CustomButton(
                      title: "Next",
                      fontSize: 16,
                      isLoading: forgetPasswordController.isLoading.value,
                      color: AppColors.bgColor,
                      onTap: () {
                        forgetPasswordController.forgetPassword();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
