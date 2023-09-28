import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RoundButton extends StatelessWidget {
  final bool loading;
  final double width, height;
  final String title;
  final VoidCallback onPressed;
  final Color buttonColor, textColor;
  const RoundButton(
      {super.key,
      this.buttonColor = Vx.red500,
      this.textColor = Vx.white,
      required this.title,
      required this.onPressed,
      this.width = 60.0,
      this.height = 50.0,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator().centered()
        : title.text
            .size(16)
            .align(TextAlign.center)
            .color(textColor)
            .makeCentered()
            .box
            .size(width, height)
            .color(buttonColor)
            .rounded
            .makeCentered()
            .onTap(() {
            onPressed();
          });
  }
}
