import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/Driver Model.dart';
import '../repositary/common_repositary.dart';


class AddDriverController extends GetxController {
  final CommonRepository commonRepository = CommonRepository();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RxList<Buslist> buslist = <Buslist>[].obs;

  GetBuslist() async {
    List<Buslist?> buslist =
    await commonRepository.getbuslist();
    if (buslist.isNotEmpty) {
      for (Buslist? data in buslist) {
        if (data != null) {
          buslist.add(data);
        }
      }
    }
  }

  Future<bool> addDriver({required Map<String, String> body,
  }) async {
    BusListingResponse? DriverResponse =
    await commonRepository.addDriver(body: body,);
    if (DriverResponse != null) {
      return true;
    } else {
      return false;
    }
  }

}