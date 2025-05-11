import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_divider_text.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';
import 'package:social_media/view/buttom_navi_bar_view/buttom_navi_bar_view.dart';
import 'package:social_media/view/forgetSystem_view/forget_password_view/forget_password_view.dart';
import 'package:social_media/view/home_view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: AppColors.black100),),
        centerTitle: true,
        leading: GestureDetector(
            onTap: Get.back,
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 54),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.splashBg, height: 40, width: 200),
              ],
            ),
            SizedBox(height: 40),
            CustomText(
              title: "Email",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            CustomTextFormField(hintText: "Enter your email address..."),
            SizedBox(height: 10),
            CustomText(
              title: "Password",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "Enter password",
              suffixIcon: Icon(Icons.visibility),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: AppColors.mainColor,
                    ),
                    CustomText(title: "Keep me logged in", fontSize: 16),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>ForgetPasswordView());
                  },
                  child: CustomText(
                    title: "Forget Password?",
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomButton(
              title: "Log In",
              fontSize: 16,
              onTap: () {
                Get.to(() => ButtomNaviBarView());
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
                  title: "Didn’t have an account? ",
                  color: AppColors.black100,
                  fontSize: 16,
                ),
                CustomText(
                  title: "Create an Account",
                  color: AppColors.mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
