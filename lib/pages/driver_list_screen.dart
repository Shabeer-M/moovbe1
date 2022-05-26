import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moovbe/pages/add_driver.dart';
import 'package:moovbe/utils/app_colour.dart';

import 'new_bus_details_screen.dart';

class DriverList extends StatelessWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: AppColors.white,),
        title: Text('Driver List',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(

              shrinkWrap: true,
              itemCount: 4,
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
                            'assets/images/driver.png',
                            height: 40,
                          ),
                          title: Text(
                            'Rohit sharma',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryBlack,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            'Licn no: PJ5151961616',
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
                                'Delete',
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: ()  {
                  Get.to(() => AddDriver());
                },
                child: Text(
                  'Add Driver',
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


    );
  }
}
