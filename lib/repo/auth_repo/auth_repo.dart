import 'package:social_media/res/apps_url/apps_url.dart';
import 'package:social_media/services/network_api_services.dart';

class AuthRepo {
  final _apiServices = NetworkApiServices();

  Future loginApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppsUrl.loginUrl);
    print(response);
    return response;
  }

  Future forgetPasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(
      data,
      AppsUrl.forgetPasswordUrl,
    );
    return response;
  }

  //Sign up page
  Future signUpApi(var data) async {
    dynamic response = await _apiServices.postMultipartApi(
      data: data,
      url: AppsUrl.signUpUrl,
    );
    print(response);
    return response;
  }

  Future verifyOtpApi(var data, String token) async {
    dynamic response = await _apiServices.postApi(data, AppsUrl.verifyOtpUrl,authToken: token);
    print(response);
    return response;
  }

  Future resetPasswordApi(var data, String token) async {
    dynamic response = await _apiServices.postApi(data, AppsUrl.resetPasswordUrl,authToken: token);
    print(response);
    return response;
  }

  //This is for resend the otp if any problem raise
  Future resendOtpApi(var data, String token) async {
    dynamic response = await _apiServices.postApi(data, AppsUrl.resendOtpUrl,authToken: token);
    print(response);
    return response;
  }

  Future googleSignUpApi(var data) async {
    dynamic response = await _apiServices.getApi(AppsUrl.googleUrl);
    print(response);
    return response;
  }
}
