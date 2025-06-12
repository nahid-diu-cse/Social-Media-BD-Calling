import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_media/model/auth_response_model/forget_password/forget_password_response_model.dart';

import '../../repo/auth_repo/auth_repo.dart';
import '../../utils/app_utils.dart';
import '../../view/forgetSystem_view/email_verification_view/email_verification_view.dart';

class ForgetPasswordController extends GetxController {
  final _api = AuthRepo();
  var emailController = TextEditingController().obs;
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
            AppUtils.snackBar("Forget Password", "Code Send to your email..");
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
}
