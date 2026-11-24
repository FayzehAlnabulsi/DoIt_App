import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:do_it/constants/app_colors.dart';
import 'package:do_it/constants/app_constants.dart';
import 'package:do_it/provider/provider_class.dart';
import 'package:do_it/network/network_calls.dart';

class Repositories {
  static Future<String?> signIn({
    required String userName,
    required String password,
    required String fcmToken,
  }) async {
    String response = await NetworkCalls.post(
      AppConstants.logIn,
      jsonEncode({
        "userName": userName,
        "password": password,
        "FcmToken": fcmToken,
        "Language": "ar",
      }),
    );

    return response;
  }

  static Future<String?> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    String response = await NetworkCalls.post(
      AppConstants.signUp,
      jsonEncode({
        "id": 0,
        "fullName": fullName,
        "email": email,
        "password": password,
      }),
    );

    return response;
  }
}
