import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/colors.dart';

import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(),
      );

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }
}
