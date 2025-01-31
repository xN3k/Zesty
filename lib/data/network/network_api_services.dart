import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:zesty/data/exception/app_exceptions.dart';
import 'package:zesty/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      responseJson = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException("No Internet Connection");
    } on TimeoutException {
      throw FetchDataException('Timeout Try again');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('TIme out. Please try again later');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server');
    }
  }
}
