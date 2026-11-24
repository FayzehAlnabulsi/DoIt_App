import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:do_it/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class NetworkCalls {
  static Map<String, String> headersWithToken({required String token}) => {
    'Content-Type': 'application/json',
    'accept': '*/*',
    'Authorization': 'Bearer $token',
  };

  static Map<String, String> headers() => {
    'Content-Type': 'application/json',
    'accept': '*/*',
  };

  static Future<String> get(String url, {String? token}) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: token != null ? headersWithToken(token: token) : headers(),
      );

      debugPrint("get response.body = ${response.body}");
      debugPrint("get response.code = ${response.statusCode}");

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.badRequest) {
        return response.body;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        return AppConstants.unauthorized;
      } else {
        return AppConstants.serverException;
      }
    } on TimeoutException catch (e) {
      return AppConstants.timeOutException;
    } on SocketException catch (_) {
      return AppConstants.socketException;
    } on HttpException catch (e) {
      return AppConstants.serverException;
    }
  }

  static Future<String> post(String url, String body, {String? token}) async {
    print('post url = $url');
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: token != null ? headersWithToken(token: token) : headers(),
      );
      var hed = headers();
      print('language headers = $hed');
      debugPrint("post response.body = ${response.body}");
      debugPrint("post response.code = ${response.statusCode}");

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.badRequest) {
        return response.body;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        return AppConstants.unauthorized;
      } else {
        return AppConstants.serverException;
      }
    } on TimeoutException catch (e) {
      return AppConstants.timeOutException;
    } on SocketException catch (_) {
      return AppConstants.socketException;
    } on HttpException catch (e) {
      return AppConstants.serverException;
    }
  }

  static Future<String> put(String url, String body, {String? token}) async {
    try {
      var response = await http.put(
        Uri.parse(url),
        body: body,
        headers: token != null ? headersWithToken(token: token) : headers(),
      );

      debugPrint("put response.body = ${response.body}");
      debugPrint("put response.code = ${response.statusCode}");

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.badRequest) {
        return response.body;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        return AppConstants.unauthorized;
      } else {
        return response.body;
      }
    } on TimeoutException catch (e) {
      return AppConstants.timeOutException;
    } on SocketException catch (_) {
      return AppConstants.socketException;
    } on HttpException catch (e) {
      return AppConstants.serverException;
    }
  }

  static Future<String> delete(String url, String body, {String? token}) async {
    try {
      var response = await http.delete(
        Uri.parse(url),
        body: body,
        headers: token != null ? headersWithToken(token: token) : headers(),
      );

      debugPrint("delete response.body = ${response.body}");
      debugPrint("delete response.code = ${response.statusCode}");

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.badRequest) {
        return response.body;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        return AppConstants.unauthorized;
      } else {
        return response.body;
      }
    } on TimeoutException catch (e) {
      return AppConstants.timeOutException;
    } on SocketException catch (_) {
      return AppConstants.socketException;
    } on HttpException catch (e) {
      return AppConstants.serverException;
    }
  }

  static void checkAndThrowError(http.Response response) {
    if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
  }
}
