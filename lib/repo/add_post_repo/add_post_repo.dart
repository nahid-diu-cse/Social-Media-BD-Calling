import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../res/apps_url/apps_url.dart';
import '../../services/network_api_services.dart';

class AddPostRepo {
  final _apiServices = NetworkApiServices();

  Future addPostUrl(dynamic data, File? file) async {
    print("hello");

    dynamic response = await _apiServices.postMultipartApi(
      data: data,
      url: AppsUrl.addPostUrl,
      fileKey: "files",
      file: file,
    );
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
