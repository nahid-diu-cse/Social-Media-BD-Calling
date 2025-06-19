import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/model/user_pref_model/user_pref_model.dart';
import 'package:social_media/view_model/services/user_preferences.dart';

import '../../view/authentication_view/login_view.dart';

class AuthErrorServices {
  UserPreferences userPreferences = UserPreferences();

  Future<void> navigateToLogin() async {
    await userPreferences.saveUser(
      UserPrefModel.fromJson({"token": "", "isLogin": false}),
    );
    Get.to(() => LoginView());
  }
}
