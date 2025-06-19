import 'package:flutter/foundation.dart';

import '../../res/apps_url/apps_url.dart';
import '../../services/network_api_services.dart';

class ConnectionsRepo{
  final _apiServices = NetworkApiServices();


  Future nearbyUserUrl() async {
    dynamic response = await _apiServices.getApi(
      AppsUrl.nearbyUserUrl,
    );
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}