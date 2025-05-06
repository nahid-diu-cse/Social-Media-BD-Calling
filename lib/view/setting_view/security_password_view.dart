import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/customStyle/customText.dart';

class SecurityPasswordView extends StatefulWidget {
  const SecurityPasswordView({super.key});

  @override
  State<SecurityPasswordView> createState() => _SecurityPasswordViewState();
}

class _SecurityPasswordViewState extends State<SecurityPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomText(
                  title: "Current Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "**********",
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
              hintText: "*********",
              suffixIcon: Icon(Icons.visibility),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomText(
                  title: "Confirm Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "********",
              suffixIcon: Icon(Icons.visibility),
            ),
            SizedBox(height: 20),
            CustomButton(
              title: "Next",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
