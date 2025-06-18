import 'package:get/get.dart';
import '../../res/apps_url/apps_url.dart';
import '../../services/network_api_services.dart';
import '../../view_model/auth_controller/login_controller.dart';

class ProfileRepo {
  final _apiServices = NetworkApiServices();

  LoginController loginController = Get.put(LoginController());

  Future fetchFollowers() async {
    dynamic response = await _apiServices.getApi(
      AppsUrl.pFetchFollowerUrl,
      token: loginController.loginData.value.data!.accessToken,
    );
    print(response);
    return response;
  }
}
