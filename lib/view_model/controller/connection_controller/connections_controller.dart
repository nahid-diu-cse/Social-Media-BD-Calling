import 'package:get/get.dart';
import 'package:social_media/model/connections_data_model/follow_data_model.dart';
import 'package:social_media/model/connections_data_model/my_connection_data_model.dart';
import 'package:social_media/model/connections_data_model/nearby_user_data_model.dart';
import 'package:social_media/repo/connections_repo/connections_repo.dart';

import '../../../view/home_view/friend_connection_view/friend_connection_view.dart';
import '../../../view/home_view/nearby_view/nearby_connection_view.dart';

class ConnectionsController extends GetxController {
  final _api = ConnectionsRepo();
  var isLoading = false.obs;
  var nearbyUsersData = NearbyUserDataModel().obs;
  var followData = FollowDataModel().obs;
  var myConnectionData = MyConnectionDataModel().obs;

  Future<void> nearbyUser() async {
    isLoading.value = true;
    _api.nearbyUserUrl().then((value) {
      if (value["success"] == true) {
        nearbyUsersData.value = NearbyUserDataModel.fromJson(value);
        Get.to(NearbyView());
        isLoading.value = false;
      }
    });
  }

  Future<void> followUser(String id) async {
    isLoading.value = true;
    _api.folowUserUrl(id).then((value) {
      if (value["success"] == true) {
        followData.value = FollowDataModel.fromJson(value);
        isLoading.value = false;
      }
    });
  }



  Future<void> sendRequest(String id) async {
    _api.sendRequestUrl(id).then((value) {
      if (value["success"] == true) {
        followData.value = FollowDataModel.fromJson(value);
      }
    });
  }

  Future<void> myConnections() async {
    isLoading.value = true;
    _api.myConnectionsUrl().then((value) {
      if (value["success"] == true) {
        myConnectionData.value = MyConnectionDataModel.fromJson(value);
        Get.to(() => FriendConnectionView());
        isLoading.value = false;
      }
    });
  }
}
