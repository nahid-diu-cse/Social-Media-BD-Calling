import 'package:get/get.dart';
import 'package:social_media/model/profile_response_model/my_follower_data_model.dart';
import 'package:social_media/model/profile_response_model/my_following_data_model.dart';
import 'package:social_media/repo/profile_repo/profile_repo.dart';
import 'package:social_media/view_model/services/auth_error_services.dart';
import '../../../utils/app_utils.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final _api = ProfileRepo();
  final followerData = MyFollowerDataModel().obs;
  final followingData = MyFollowingDataModel().obs;

  Future<void> fetchFollowers() async {
    isLoading.value = true;
    _api
        .fetchFollowers()
        .then((value) {
          if (value['success'] == true) {
            followerData.value = MyFollowerDataModel.fromJson(value);
          } else {
            AuthErrorServices().navigateToLogin();
          }
          isLoading.value = false;
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AuthErrorServices().navigateToLogin();
          AppUtils.snackBar("Verification Failed", "Log in again to verify");
        });
  }

  Future<void> fetchFollowings() async {
    isLoading.value = true;
    _api
        .fetchFollowing()
        .then((value) {
          if (value['success'] == true) {
            followingData.value = MyFollowingDataModel.fromJson(value);
          } else {
            AuthErrorServices().navigateToLogin();
          }
          isLoading.value = false;
        })
        .onError((error, stackTrace) {
          isLoading.value = false;
          AuthErrorServices().navigateToLogin();
          AppUtils.snackBar("Verification Failed", "Log in again to verify");
        });
  }
}
