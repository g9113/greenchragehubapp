import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:greenchargehub/auth/helper.dart';

import 'model.dart';

class OnBoardNotifier extends ChangeNotifier {
  late Future<List<Booking>> bookingData;

  userconfslots(Booking model) {
    AuthHelper.booking(model).then((response) {

      if (response) {
        Get.back();
        print(response);
        Get.snackbar("done", "Your are done");
      } else if (!response) {
        Get.snackbar("Phone Number is Already Exists", "Phone Number");
      }
    }).catchError((error) {
      print(model.toJson());
      print(error);
      Get.snackbar(' failed', 'Invalid');
    });
  }
}
