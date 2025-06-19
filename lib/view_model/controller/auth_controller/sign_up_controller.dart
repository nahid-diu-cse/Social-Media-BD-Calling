import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/model/auth_response_model/signup/signup_response_model.dart';

import '../../../repo/auth_repo/auth_repo.dart';
import '../../../utils/app_utils.dart';
import '../../../view/authentication_view/birthday_view.dart';
import '../../../view/authentication_view/verification_view.dart';

class SignUpController extends GetxController {
  // TextEditingControllers for all fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final locationController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //verify otp page
  final otpController = TextEditingController();

  var isLoading = false.obs;
  var passwordVisible = false.obs;
  var confirmPasswordVisible = false.obs;

  var signUpData = SignUpResponseModel().obs;

  final _api = AuthRepo();

  bool validateForm() {
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        locationController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Error", "Invalid email address");
      return false;
    }
    if (passwordController.text.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters");
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return false;
    }
    return true;
  }

  Future<void> createAccount() async {
    if (!validateForm()) return;

    isLoading.value = true;
    Map<String, dynamic> data = {
      'firstName': firstNameController.text.trim(),
      'lastName': lastNameController.text.trim(),
      'location': locationController.text.trim(),
      'email': emailController.text.trim(),
      'phoneNumber': phoneNumberController.text,
      'password': passwordController.text,
    };

    _api
        .signUpApi(data)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            signUpData.value = SignUpResponseModel.fromJson(value);
            print("--------------------------------------------------");
            print(signUpData.value.message);
            Get.to(() => VerificationView());
          } else {
            AppUtils.snackBar("Sign Up Failed", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Sign Up Failed", error.toString());
        });
  }

  Future<void> verifyOtp() async {
    isLoading.value = true;
    Map<String, dynamic> data = {'otp': int.parse(otpController.text.trim())};
    _api
        .verifyOtpApi(data, signUpData.value.data!.token!)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            AppUtils.snackBar("Otp", value['message']);
            Get.to(BirthdayView());
          } else {
            AppUtils.snackBar("Otp", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Otp", error.toString());
        });
  }


  Future<void> resendOtp() async {
    isLoading.value = true;
    Map data = {'email': emailController.value.text};
    _api
        .resendOtpApi(data, signUpData.value.data!.token!)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            AppUtils.snackBar("Otp", value['message']);
          } else {
            AppUtils.snackBar("Otp", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Otp", error.toString());
        });
  }

  Future<void> googleSignUp() async {
    isLoading.value = true;
    Map data = {'email': emailController.value.text};
    _api
        .forgetPasswordApi(data)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            AppUtils.snackBar("Forget Password", "Code Send to your email..");
          } else {
            AppUtils.snackBar("Forget Password", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Forget Password", error.toString());
        });
  }

  @override
  void onClose() {
    // Dispose controllers
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
