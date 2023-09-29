import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/views_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  void isLogin() {
    final UserPreference userPreference = UserPreference();
    userPreference.getUser().then((value) {
      if (kDebugMode) {
        print(value.token);
      }
      if (value.token!.isEmpty || value.token.toString() == "null") {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.loginScrren));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.homeScreen));
      }
    });
  }
}
