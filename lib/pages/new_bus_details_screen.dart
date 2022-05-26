import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moovbe/pages/add_driver.dart';
import 'package:moovbe/pages/driver_list_screen.dart';

import '../utils/app_colour.dart';

class NewBusDetails extends StatefulWidget {
  const NewBusDetails({Key? key}) : super(key: key);

  @override
  State<NewBusDetails> createState() => _NewBusDetailsState();
}

class _NewBusDetailsState extends State<NewBusDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: AppColors.white,),
        title: Text('KSRTC SwiftScania',
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(() => DriverList());
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: AppColors.darkGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: Text(
                                      'Driver Name',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                                    child: Text('License no: PJ515196161655',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 13
                                        )),
                                  ),
                                ],
                              ),

                              // SizedBox(
                              //   width: 50,
                              // ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                                child: Image.asset(
                                  'assets/images/driver.png',
                                  height: 100,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Column(

                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(flex: 1,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/seat_red.png'),
                              ),
                              Spacer(flex: 2,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/seat_red.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/seat_red.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/seat_red.png'),
                              ),
                              Spacer(flex: 1,),

                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
