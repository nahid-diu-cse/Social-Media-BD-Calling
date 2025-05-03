import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/customStyle/customText.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verification",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
           // color: AppColors.black100,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32),
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
            CustomButton(title: "Verify OTP", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
