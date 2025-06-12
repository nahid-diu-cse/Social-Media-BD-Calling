import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;

    Map<String, String> headers = {'auth': ''};

    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 100));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    dynamic responseJson;
    Map<String, String> headers = {
      'auth': '',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //SocketException internet exception denote kore.
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  Future<dynamic> putApi(var data, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    dynamic responseJson;
    Map<String, String> headers = {'auth': ''};
    try {
      final response = await http
          .put(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //SocketException internet exception denote kore.
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
          'Error occured while communication with server${response.statusCode}',
        );
    }
  }
}
