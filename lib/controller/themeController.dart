import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;
  late SharedPreferences storage;

  // Custom dark theme
  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

  // Custom light theme
  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
  );

  // Dark mode toggle action
  void changeTheme() {
    isDark.value = !isDark.value;

    // Save the value to secure storage
    storage.setBool("isDark", isDark.value);
  }

  // Init method of controller
  @override
  void onInit() async {
    super.onInit();
    storage = await SharedPreferences.getInstance();
    isDark.value = storage.getBool("isDark") ?? false;
  }

  Color get textColor => isDark.value ? Colors.white : Colors.black;
}
