import 'package:get/get.dart';
import 'package:social_media/model/profile_response_model/my_follower_data_model.dart';
import 'package:social_media/repo/profile_repo/profile_repo.dart';

import '../../utils/app_utils.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final _api = ProfileRepo();
  final followerData = MyFollowerDataModel().obs;

  Future<void> fetchFollowers() async {
    isLoading.value = true;
    _api
        .fetchFollowers()
        .then((value) {
          isLoading.value = false;

          if (value['success'] == true) {
          } else {}
        })
        .onError((error, stackTrace) {
          isLoading.value = false;

          AppUtils.snackBar("Followers Fetch", "Followers Fetch Failed.");
        });
  }
}
