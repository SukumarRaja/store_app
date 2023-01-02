import 'package:flutter/material.dart';

import '../../../controller/auth.dart';
import '../../widgets/common_textform_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextFormField(
            hintText: "Enter your email",
            controller: AuthController.to.lEmail,
          ),
        ],
      ),
    );
  }
}
