import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class InternetExceptionsWidgets extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionsWidgets({super.key, required this.onPress});

  @override
  State<InternetExceptionsWidgets> createState() =>
      _InternetExceptionsWidgetsState();
}

class _InternetExceptionsWidgetsState extends State<InternetExceptionsWidgets> {
  @override
  Widget build(BuildContext context) {
    return VStack([
      SizedBox(
        height: Get.height * 0.15,
      ),
      VxBox(
          child: const Icon(
        Icons.cloud_off,
        color: Colors.red,
        size: 50,
      )).alignCenter.px20.makeCentered(),
      "internet_exceptions"
          .tr
          .text
          .size(16)
          .semiBold
          .center
          .make()
          .box
          .py20
          .alignCenter
          .make(),
      SizedBox(
        height: Get.height * 0.15,
      ),
      'Retry'
          .text
          .white
          .make()
          .box
          .size(160, 44)
          .alignCenter
          .rounded
          .red500
          .makeCentered()
          .onTap(() {
        widget.onPress();
      })
    ]);
  }
}
