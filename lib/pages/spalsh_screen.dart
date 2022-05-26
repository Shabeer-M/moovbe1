import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colour.dart';
import '../utils/app_preference.dart';
import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLoggedIn;

  @override
  void initState() {
    checkLogin();

    Timer(
        const Duration(
          seconds: 3,
        ), () {
      if (isLoggedIn != null && isLoggedIn == true) {
        Get.offNamed(Routes.home);
      } else {
        Get.offNamed(Routes.login);
      }
    });

    super.initState();
  }

  Future<void> checkLogin() async {
    isLoggedIn = await AppPreferences.getLoginStatus();
    log('login--------- ' + isLoggedIn.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(
          'assets/images/moovbe.svg',
          // height: 42,
          // width: 42,
        ),
        // Image.assets('assets/images/fgd_logo.png'),
      ),
    );
  }
}
