import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../res/appColors/app_colors.dart';
import '../../../res/commonWidget/customText.dart';
import '../../../res/commonWidget/custom_app_bar.dart';
import '../../../res/commonWidget/custom_button.dart';
import '../birthday_view/birthday_view.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Verification"),
      body: Center( // Center everything in the body
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Only take as much space as needed
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(title: "Enter Verification Code", fontSize: 30),
              SizedBox(height: 15),
              CustomText(
                title:
                "Please enter the 6-digit code sent to your phone \nnumber.",
                fontSize: 15,
                color: AppColors.black33,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 45,
                  fieldWidth: 45,
                  activeColor: Colors.black,
                  selectedColor: Colors.blue,
                  inactiveColor: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "If you didn’t receive a code, ",
                    color: AppColors.black33,
                  ),
                  CustomText(
                    title: "Resend",
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 45),
              CustomButton(
                title: "Verify OTP",
                onTap: () {
                  Get.to(BirthdayView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
