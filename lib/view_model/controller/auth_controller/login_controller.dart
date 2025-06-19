import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/model/auth_response_model/login/login_error_response_model.dart';
import 'package:social_media/model/auth_response_model/login/login_response_model.dart';
import 'package:social_media/repo/auth_repo/auth_repo.dart';
import 'package:social_media/utils/app_utils.dart';
import 'package:social_media/view_model/services/user_preferences.dart';

import '../../../model/user_pref_model/user_pref_model.dart';
import '../../../view/buttom_navi_bar_view/buttom_navi_bar_view.dart';

class LoginController extends GetxController {
  final _api = AuthRepo();
  final loginData = LogInResponseModel().obs;
  var isChecked = false.obs;
  var isLoading = false.obs;

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  UserPreferences userPreferences = UserPreferences();

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  Future<void> login() async {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    if (kDebugMode) {
      print(data);
    }
    isLoading.value = true;
    _api
        .loginApi(data)
        .then((value) async {
          isLoading.value = false;

          if (value['success'] == true) {
            loginData.value = LogInResponseModel.fromJson(value);
            UserPrefModel userPrefModel = UserPrefModel.fromJson({
              "token": value["data"]["accessToken"],
              "isLogin": true,
            });

            userPreferences.saveUser(userPrefModel).then((value) async {
              AppUtils.snackBar("Login", "Login Successful.");
              UserPrefModel data = await userPreferences.getUser();
              print(data.token);
              Get.offAll(() => ButtomNaviBarView());
            });
          } else {
            LogInErrorResponseModel.fromJson(value);
            AppUtils.snackBar("Login", "Login Failed.");
          }
        })
        .onError((error, stackTrace) {
          isLoading.value = false;

          AppUtils.snackBar("Login", "Login Failed.");
        });
  }

  void clearControllers() {
    emailController.value.clear();
    passwordController.value.clear();
  }
}
