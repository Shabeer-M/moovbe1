import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colour.dart';
import '../utils/controller_object.dart';
import '../utils/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool hidePassword = true;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
               image: DecorationImage(
                image: AssetImage("assets/images/HD-wallpaper-polygons-black-red-abstract-color-modern-digital-designs-colours-art.jpg"),
        fit: BoxFit.cover,
      ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 34.0, horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text('Welcome',
                          style: GoogleFonts.rambla(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 50))),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 35,
                bottom: 30,
              ),
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Form(
                    key: authController.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        TextFormField(
                          showCursor: true,
                          controller: authController.userNameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle:
                                const TextStyle(color: AppColors.containerBorder),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(
                                color: AppColors.containerBorder,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: AppColors.containerBorder),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username is required';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          return TextFormField(
                            controller: authController.passwordController,
                            obscureText: authController.obscurePassword.value,
                            showCursor: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle:
                                  const TextStyle(color: AppColors.containerBorder),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: AppColors.containerBorder),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: AppColors.containerBorder),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    // hidePassword = !hidePassword;
                                    authController.obscurePassword.value =
                                        !authController.obscurePassword.value;
                                  });
                                },
                                child: authController.obscurePassword.value
                                    ? const Icon(
                                        Icons.visibility,
                                        color: AppColors.containerBorder,
                                        // size: defaultIconSize,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: AppColors.containerBorder,
                                        // size: defaultIconSize,
                                      ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (authController.formKey.currentState!.validate()) {
                                bool success = await authController.login();
                                if (success) {
                                  // authController.isLoggedIn.value = true;
                                  Get.offAllNamed(Routes.home);
                                  // Get.to(() => HomePage());
                                }
                              }
                            },
                            child: Text(
                              'Login',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.primary),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  side: const BorderSide(color: AppColors.primary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
