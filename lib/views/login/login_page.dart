import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/images_assets.dart';
import 'package:getx_mvvm/res/components/my_text_field.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/views_models/controller/login/login_view_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: "login".tr.text.make(),
        centerTitle: true,
        elevation: 0,
        leading: const Icon(null),
      ),
      body: Form(
        key: formKey,
        child: VStack([
          Image.asset(ImagesAssets.splashScreen)
              .box
              .size(200, 200)
              .makeCentered(),
          30.heightBox,
          MyTextField(
            textFieldType: TextInputType.emailAddress,
            onSubmit: () {},
            foucesNode: loginController.emailNode.value,
            textEditingController: loginController.emailController.value,
            hint: "email_hint",
            validate: () {
              Utils.snackBar("Email", "Enter your email address");
            },
          ),
          20.heightBox,
          MyTextField(
              textFieldType: TextInputType.visiblePassword,
              onSubmit: () {},
              obscureText: true,
              foucesNode: loginController.passwordNode.value,
              textEditingController: loginController.passwordController.value,
              hint: "passwords",
              validate: () {
                Utils.snackBar("Password", "Enter your password");
              }),
          40.heightBox,
          VStack([
            Obx(
              () => RoundButton(
                title: "Login",
                loading: loginController.loading.value,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    loginController.loginApi();
                  }
                },
                width: Get.width - 150,
              ),
            )
          ])
        ]).px20().scrollVertical().centered(),
      ),
    );
  }
}
