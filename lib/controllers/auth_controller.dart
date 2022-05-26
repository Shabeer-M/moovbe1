
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/login_model.dart';
import '../repositary/login_repositary.dart';
import '../utils/app_preference.dart';
import '../utils/controller_object.dart';

class AuthController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RxBool obscurePassword = true.obs;
  RxString token = ''.obs;
  RxBool isLoggedIn = false.obs;

  final LoginRepository _repository = LoginRepository();

  Future<bool> login() async {
    LoginResponse? response = await _repository.login();
    if (response != null && response.data != null) {
      AppPreferences.setToken(response.data!.token!);
      AppPreferences.setLoginStatus(true);
      authController.token.value = response.data!.token!;
      return true;
    } else {
      return false;
    }
  }


  void clear() {
    userNameController.clear();
    passwordController.clear();
  }
}
