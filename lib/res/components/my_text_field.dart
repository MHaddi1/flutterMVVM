import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final TextInputType textFieldType;
  final TextEditingController textEditingController;
  final VoidCallback validate;
  final bool obscureText;
  final FocusNode foucesNode;
  final VoidCallback onSubmit;
  const MyTextField(
      {super.key,
      required this.textEditingController,
      required this.hint,
      required this.validate,
      this.obscureText = false,
      required this.foucesNode,
      required this.textFieldType,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          validate();
        }
        return null;
      },
      focusNode: foucesNode,
      onFieldSubmitted: (value) {},
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint.tr,
      ),
    );
  }
}
