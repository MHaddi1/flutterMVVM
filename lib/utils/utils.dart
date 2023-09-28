import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.drakColor,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }

  static void snackBar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: AppColor.drakColor,
        colorText: Colors.white,
        duration: const Duration(milliseconds: 750));
  }
}
