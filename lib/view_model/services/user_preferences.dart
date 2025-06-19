
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user_pref_model/user_pref_model.dart';

class UserPreferences extends GetxController {
  Future<bool> saveUser(UserPrefModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', "${responseModel.token}");
    sp.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<UserPrefModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');
    return UserPrefModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
