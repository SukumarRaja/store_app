import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_textform_field.dart';
import '../../widgets/intl_phone_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CommonText(
            text: "Register",
            fontSize: AppFontSize.twentyFour,
            fontColor: AppColors.primary,
          ),
        ),
        Form(
          key: AuthController.to.registerKey,
          child: Column(
            children: [
              CommonTextFormField(
                hintText: "Enter your name",
                controller: AuthController.to.lEmail,
                validator: (data) {
                  if (data!.isEmpty || data == "") {
                    return "Please enter your name";
                  } else if (data.length < 3) {
                    return "Name at least 3 character";
                  }
                  return null;
                },
              ),
              CommonTextFormField(
                hintText: "Enter your email",
                controller: AuthController.to.lEmail,
                validator: (data) {
                  if (data!.isEmpty || data == "") {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntlPhoneField(
                  hintText: "Enter your phone",
                  initialCountryCode: "IN",
                  fontFamily: "Oswald",
                  validator: (data) {
                    return null;
                  },
                ),
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
        CommonButton(
          text: "Register",
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
              text: "Already have an account",
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const CommonText(
                  text: "Login",
                  fontColor: AppColors.primary,
                )),
          ],
        )
      ],
    ));
  }
}
