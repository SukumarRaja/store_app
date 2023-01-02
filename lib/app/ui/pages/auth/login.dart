import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_textform_field.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: AuthController.to.loginKey,
            child: Column(
              children: [
                CommonTextFormField(
                  hintText: "Enter your email",
                  controller: AuthController.to.lEmail,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Please enter your email";
                    } else if (data.length < 3) {
                      return "Name at least 3 character";
                    }
                    return null;
                  },
                ),
                CommonTextFormField(
                  hintText: "Enter your password",
                  obscureText: true,
                  controller: AuthController.to.lEmail,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const CommonText(
                text: "Forgot Password?",
              )),
          CommonButton(
            text: "Login",
            onPressed: () {
              if (AuthController.to.loginKey.currentState!.validate()) {
                AuthController.to.login();
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CommonText(
                text: "Don't have an account",
              ),
              SizedBox(width: Get.width * 0.04),
              TextButton(
                  onPressed: () {},
                  child: const CommonText(
                    text: "Signup",
                  )),
            ],
          )
        ],
      ),
    );
  }
}
