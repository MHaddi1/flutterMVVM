import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/images_assets.dart';
import 'package:getx_mvvm/views_models/services/splash_services.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

            // backgroundColor: Colors.white,
            // centerTitle: true,
            // title: "email_hint".tr.text.make(),

            ),
        body: VStack([
          Image.asset(ImagesAssets.splashScreen)
              .box
              .size(200, 200)
              .shadow
              .rounded
              .makeCentered(),
          25.heightBox,
          "welcome_back".tr.text.size(18).makeCentered(),
        ]).centered());
  }
}
