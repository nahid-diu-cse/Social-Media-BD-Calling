import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  Future<dynamic> getApi(String url, {String? token}) async {
    dynamic responseJson;
    Map<String, String> headers = {};
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 100));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  Future<dynamic> postApi(var data, String url, {String authToken = ""}) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    dynamic responseJson;
    Map<String, String> headers = {
      'token': authToken,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  Future<dynamic> postFormApi(Map<String, String> data, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    dynamic responseJson;
    Map<String, String> headers = {
      'auth': '',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  Future<dynamic> postMultipartApi({
    required Map<String, dynamic> data,
    required String url,

    File? file,
    String? fileKey,
    Map<String, String>? headers,
  }) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);

    if (headers != null) {
      request.headers.addAll(headers);
    }

    request.fields['data'] = jsonEncode(data);

    // Add file if present
    if (file != null && fileKey != null) {
      request.files.add(await http.MultipartFile.fromPath(fileKey, file.path));
    }

    // Send request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    // Use your existing response handler
    return returnResponse(response);
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
