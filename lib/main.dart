import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsreaderapp/screens/newspage.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/screens/splashscreen.dart';
import 'package:newsreaderapp/utils/localstring.dart';
import 'controller/themeController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final ThemeController themeController = Get.put(ThemeController()); // Initialization of theme controller
    return Obx(
      () => GetMaterialApp(
          translations: LocalString(),
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          theme: themeController.isDark.value
              ? themeController.darkTheme
              : themeController.lightTheme,
          home: SplashScreen()),
    );
  }
}
