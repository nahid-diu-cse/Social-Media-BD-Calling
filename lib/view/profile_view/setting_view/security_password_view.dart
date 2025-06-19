import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';

class SecurityPasswordView extends StatefulWidget {
  const SecurityPasswordView({super.key});

  @override
  State<SecurityPasswordView> createState() => _SecurityPasswordViewState();
}

class _SecurityPasswordViewState extends State<SecurityPasswordView> {
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 15.sp),
          onTap: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: height*.1,),
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
