import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:social_media/utils/app_utils.dart';
import 'package:social_media/view/buttom_navi_bar_view/buttom_navi_bar_view.dart';
import 'package:social_media/view/home_view/home_view.dart';
import 'package:social_media/view_model/services/user_preferences.dart';

import '../../view/onBoarding_view/view/onBoaring_view.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    print("hiii");
    userPreferences
        .getUser()
        .then(
          (value) => {
            if ((value.isLogin == false ||
                    value.isLogin.toString() == 'null'))// ||isTokenExpired("${value.token}")
              {
                Timer(
                  const Duration(seconds: 3),
                  () => Get.to(OnBoardingView()),
                ),
              }
            else
              {
                Timer(
                  const Duration(seconds: 3),
                  () => Get.to(ButtomNaviBarView()),
                ), //homeScreen
              },
          },
        )
        .onError(
          (error, stackTrace) => {AppUtils.snackBar('Splash error', '$error')},
        );
  }

  bool isTokenExpired(String token) {

    print("Token Expired");
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        return true;
      }

      final payload = json.decode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      );
      final exp = payload['exp'];

      if (exp == null) {
        return true;
      }

      final currentTime = DateTime.now().millisecondsSinceEpoch / 1000;

      // Check if the token is expired
      if (exp < currentTime) {
        return false; // Token is expired
      }
      return true; // Token is still valid
    } catch (e) {
      return true; // Something went wrong, assume the token is invalid
    }
  }
}
