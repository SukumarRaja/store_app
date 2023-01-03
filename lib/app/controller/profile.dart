import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  final ScrollController scrollController = ScrollController();
  final _isDarkTheme = false.obs;

  get isDarkTheme => _isDarkTheme.value;

  set isDarkTheme(value) {
    _isDarkTheme.value = value;
  }

  final _top = 0.0.obs;

  get top => _top.value;

  set top(value) {
    _top.value = value;
  }
}
