import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/views_models/controller/user_preference/user_preference_view_model.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final UserPreference userPreference = UserPreference();
  final emailNode = FocusNode().obs;
  final passwordNode = FocusNode().obs;
  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    String email = emailController.value.text;
    String password = passwordController.value.text;
    if (kDebugMode) {
      print(email);
      print(password);
    }
    Map data = {"email": email, "password": password};
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'Missing email or username') {
        Utils.snackBar("Login", value['error']);
      } else {
        userPreference.saveUser(UserModel.fromJson(value)).then((value) {
          Get.toNamed(RoutesName.homeScreen);
        }).onError((error, stackTrace) {
          Utils.snackBar("Login", error.toString());
        });
        Utils.snackBar("Login", "Sucessfully logged in");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
