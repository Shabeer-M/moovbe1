import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moovbe/utils/app_colour.dart';

import '../utils/controller_object.dart';
import 'bus_list_screen.dart';

class AddDriver extends StatelessWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: AppColors.white,),
      title: Text('Add Driver',
      style: TextStyle(
        color: AppColors.white,
      ),),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.darkGrey,
    iconTheme: const IconThemeData(
    color: AppColors.primaryBlack,
    ),
    ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      showCursor: true,
                      controller: authController.userNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x2A2A2A),
                        hintText: "Enter Username",
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
                    ),SizedBox(height: 10,),
                    TextFormField(
                      showCursor: true,
                      controller: authController.userNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x3a2a0a0),
                        hintText: "Enter License NUmber",
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

                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: ()  {
                    Get.to(() => BusList());
                  },
                  child: Text(
                    'Save',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(AppColors.primary),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
