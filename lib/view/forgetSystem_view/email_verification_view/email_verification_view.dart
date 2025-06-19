import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/forgetSystem_view/change_password_view/change_password_view.dart';

import '../../../view_model/controller/auth_controller/forget_password_controller.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  ForgetPasswordController forgetPasswordController = Get.put(
    ForgetPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email Verification",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black100,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_rounded),
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(AppImages.otp)],
              ),
              SizedBox(height: 32),
              CustomText(
                title:
                    "Please enter the 4 digit code that was sent \nto ${forgetPasswordController.emailController.value.text}",
                fontSize: 17,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                color: AppColors.black100,
              ),
              SizedBox(height: 32),
              OtpTextField(
                numberOfFields: 6,
                borderColor: AppColors.black33,
                focusedBorderColor: Colors.grey,
                // styles: otpTextStyles,
                showFieldAsBox: true,
                fieldHeight: 45,
                borderWidth: 1,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here if necessary
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  forgetPasswordController.otpController.value.text =
                      verificationCode.toString();
                },
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t received code! ",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.black100,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      forgetPasswordController.resendCode();
                    },
                    child: Text(
                      "Resend Code?",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w500,
                        decoration:
                            TextDecoration
                                .underline, // Optional: make it look clickable
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomButton(
                isLoading: forgetPasswordController.isLoading.value,
                title: "Next",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                onTap: () {
                  forgetPasswordController.verifyOtp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
