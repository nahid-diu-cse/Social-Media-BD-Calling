import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/appColors/app_colors.dart';
import 'package:social_media/res/appImage/app_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';
import 'package:social_media/res/commonWidget/custom_button.dart';
import 'package:social_media/res/commonWidget/custom_divider_text.dart';
import 'package:social_media/res/commonWidget/custom_text_form_field.dart';
import 'package:social_media/res/commonWidget/customText.dart';

import '../../view_model/controller/auth_controller/sign_up_controller.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create Account"),
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
              CustomTextFormField(
                hintText: "Enter your first name",
                controller: controller.firstNameController,
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Last Name",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "Enter your last name",
                controller: controller.lastNameController,
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Location",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "Enter your location address...",
                controller: controller.locationController,
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Email",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "Enter your email address...",
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Phone Number",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hintText: "Enter your Phone Number...",
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Password",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              Obx(
                () => CustomTextFormField(
                  hintText: "Enter password",
                  controller: controller.passwordController,
                  obscureText: !controller.passwordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.passwordVisible.value =
                          !controller.passwordVisible.value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                title: "Confirm Password",
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              Obx(
                () => CustomTextFormField(
                  hintText: "Enter confirm password",
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.confirmPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.confirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.confirmPasswordVisible.value =
                          !controller.confirmPasswordVisible.value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => CustomButton(
                  title: "Sign Up",
                  fontSize: 16,
                  isLoading: controller.isLoading.value,
                  onTap: controller.createAccount, //
                ),
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
                  GestureDetector(
                    onTap: () {
                      Get.back(); // Or navigate to LoginView if you want: Get.to(() => LoginView());
                    },
                    child: CustomText(
                      title: "Log In",
                      color: AppColors.mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
