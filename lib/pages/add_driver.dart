import 'package:flutter/material.dart';
import 'package:moovbe/utils/app_colour.dart';

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
    ),body: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Card(
              color: AppColors.darkGrey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                  ),
                ),
              ),
            ),
          ),
          Card(
            color: AppColors.darkGrey,
            child: TextFormField(

            ),
          )
        ],
      ),
    ),


    );
  }
}
