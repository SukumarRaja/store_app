import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  TextEditingController lEmail = TextEditingController();
  TextEditingController lPassword = TextEditingController();

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  login() async {
    loginLoading = true;
    try {

    } catch (e) {
      loginLoading = false;
      debugPrint("Error from server on login $e");
    }
  }
}
