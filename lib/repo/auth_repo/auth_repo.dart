import 'package:social_media/res/apps_url/apps_url.dart';
import 'package:social_media/services/network_api_services.dart';

class AuthRepo {
  final _apiServices = NetworkApiServices();

  Future loginApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppsUrl.loginUrl);
    return response;
  }

  Future forgetPasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(
      data,
      AppsUrl.forgetPasswordUrl,
    );
    return response;
  }

  Future signUpApi(var data) async {
    dynamic response = await _apiServices.postMultipartApi(
      data: data,
      url: AppsUrl.signUpUrl,
    );
    print(response);
    print("/////////////////////////");
    return response;
  }

  Future googleSignUpApi(var data) async {
    dynamic response = await _apiServices.getApi(AppsUrl.googleUrl);
    print(response);
    return response;
  }
}
