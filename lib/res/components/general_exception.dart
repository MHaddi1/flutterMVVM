import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class GeneralExceptionsWidgets extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionsWidgets({super.key, required this.onPress});

  @override
  State<GeneralExceptionsWidgets> createState() =>
      _GeneralExceptionsWidgetsState();
}

class _GeneralExceptionsWidgetsState extends State<GeneralExceptionsWidgets> {
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
      "general_exceptions"
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
