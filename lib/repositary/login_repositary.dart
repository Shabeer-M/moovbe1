import 'dart:convert';
import 'dart:developer';

import 'package:moovbe/data/api_base_helper.dart';

import '../data/endpoints.dart';
import '../models/login_model.dart';
import '../utils/app_preference.dart';
import '../utils/controller_object.dart';


class LoginRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<LoginResponse?> login() async {
    try {
      Map<String, dynamic> body = {
        "username": authController.userNameController.text,
        "password": authController.passwordController.text,
      };
      String StrBody = jsonEncode(body);
      var response = await _helper.postJson(
        endpoint: Endpoints.login,
        body: StrBody,
        token: null,
        requiresAuth: false,
        showProgressBar: true,
      );
      if (response != null) {
        LoginResponse loginResponse = LoginResponse.fromJson(response);

      }
    } catch (e) {
      log(e.toString());
    }
  }


}
