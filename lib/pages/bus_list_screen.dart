import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colour.dart';
import 'new_bus_details_screen.dart';


class BusList extends StatefulWidget {
  const BusList({Key? key}) : super(key: key);

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/moovbe.svg'),
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColors.primary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Text(
                              'Bus',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Text('Manage your bus',
                                style: TextStyle(
                                  color: AppColors.white,
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/bus2.png',
                                height: 90,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColors.darkGrey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Text(
                              'Driver',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Text('Manage your driver',
                                style: TextStyle(
                                  color: AppColors.white,
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/driver.png',
                                height: 90,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(

                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Card(elevation: 2,
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(

                              contentPadding: EdgeInsets.only(left: 0.0, right: 8.0),

                              leading: Image.asset(
                                'assets/images/bus.png',
                                height: 40,
                              ),
                              title: Text(
                                'KSRTC',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primaryBlack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              subtitle: Text(
                                'Swift Scania',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primaryBlack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: SizedBox(
                                height: 35,
                                width: 80,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.primary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                  ),
                                  onPressed: () {
                                    // Get.to(() => BusDetails());
                                    Get.to(() => NewBusDetails());
                                  },
                                  child: Text(
                                    'Manage',
                                    style:
                                    const TextStyle(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
