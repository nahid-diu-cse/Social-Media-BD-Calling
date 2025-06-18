import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_media/model/auth_response_model/forget_password/forget_password_response_model.dart';

import '../../repo/auth_repo/auth_repo.dart';
import '../../utils/app_utils.dart';
import '../../view/authentication_view/login_view.dart';
import '../../view/forgetSystem_view/change_password_view/change_password_view.dart';
import '../../view/forgetSystem_view/email_verification_view/email_verification_view.dart';

class ForgetPasswordController extends GetxController {
  final _api = AuthRepo();
  var emailController = TextEditingController().obs;

  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;

  var otpController = TextEditingController().obs;
  var forgetPassData = ForgetPasswordResponseModel().obs;
  var isLoading = false.obs;

  Future<void> forgetPassword() async {
    isLoading.value = true;
    Map data = {'email': emailController.value.text};
    _api
        .forgetPasswordApi(data)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            forgetPassData.value = ForgetPasswordResponseModel.fromJson(value);
            AppUtils.snackBar("Forget Password", value['message']);
            Get.to(() => EmailVerificationView());
          } else {
            AppUtils.snackBar("Forget Password", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Forget Password", error.toString());
        });
  }

  Future<void> verifyOtp() async {
    isLoading.value = true;
    Map<String, dynamic> data = {
      'otp': int.parse(otpController.value.text),
    };

    _api
        .verifyOtpApi(data,forgetPassData.value.data!.token!)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            AppUtils.snackBar("Otp",value['message']);
            Get.to(() => ChangePasswordView());
          } else {
            AppUtils.snackBar("Otp", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Otp", error.toString());
        });
  }

  Future<void> resetPassword() async {
    isLoading.value = true;
    Map<String, dynamic> data = {
      'password': passwordController.value.text,
    };

    _api
        .resetPasswordApi(data,forgetPassData.value.data!.token!)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            forgetPassData.value = ForgetPasswordResponseModel.fromJson(value);
            AppUtils.snackBar("Otp",value['message']);
            Get.to(() => LoginView());
          } else {
            AppUtils.snackBar("Otp", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Otp", error.toString());
        });
  }

  Future<void> resendCode() async {
    isLoading.value = true;
    Map data = {'email': emailController.value.text};
    _api
        .resendOtpApi(data,forgetPassData.value.data!.token!)
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
            AppUtils.snackBar("Otp",  value['message']);
            Get.to(() => EmailVerificationView());
          } else {
            AppUtils.snackBar("Otp", value['message']);
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AppUtils.snackBar("Forget Password", error.toString());
        });
  }
}
