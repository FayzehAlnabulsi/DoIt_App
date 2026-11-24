import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:do_it/repositories/repositoreis.dart';
import 'package:do_it/constants/app_colors.dart';
import 'package:do_it/constants/app_constants.dart';
import 'package:do_it/models/data_handeler_model.dart';
import 'package:do_it/models/user_model.dart';

class ProviderClass extends ChangeNotifier {

  DataHandle<User?> user = DataHandle(result: AppConstants.initial);

  Future<ResultHandler?> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    ResultHandler handler = ResultHandler();

    String? data = await Repositories.signUp(
      fullName: fullName,
      email: email,
      password: password,
    );

    if (data == AppConstants.socketException) {
      handler.message = 'No internet connection';
      handler.isSuccessful = false;
      return handler;
    } else if (data == null || data == AppConstants.serverException) {
      handler.message = "Something went wrong";
      handler.isSuccessful = false;
      return handler;
    } else if (data == AppConstants.timeOutException) {
      handler.message = "Something went wrong";
      handler.isSuccessful = false;
      return handler;
    } else {
      handler.message = json.decode(data)['message'];
      handler.isSuccessful = json.decode(data)['success'];
      return handler;
    }
  }
}
