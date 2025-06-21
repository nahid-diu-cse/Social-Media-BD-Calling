import 'package:flutter/foundation.dart';

import '../../res/apps_url/apps_url.dart';
import '../../services/network_api_services.dart';

class ConnectionsRepo {
  final _apiServices = NetworkApiServices();

  Future nearbyUserUrl() async {
    dynamic response = await _apiServices.getApi(AppsUrl.nearbyUserUrl);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  Future folowUserUrl(String id) async {
    final url = "${AppsUrl.followUrl}/$id";
    dynamic response = await _apiServices.postApi({}, url);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
  Future sendRequestUrl(String id) async {
    final url = "${AppsUrl.sendRequestUrl}/$id";
    dynamic response = await _apiServices.postApi({}, url);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  Future myConnectionsUrl() async {
    dynamic response = await _apiServices.getApi(AppsUrl.myConnectionsUrl);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
