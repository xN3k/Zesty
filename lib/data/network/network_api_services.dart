import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
