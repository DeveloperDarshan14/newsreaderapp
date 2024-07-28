import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:newsreaderapp/screens/newspage.dart';

import '../constants/colors.dart';
import '../utils/networkconnection.dart';
import '../widgets/customtext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeController themeController = Get.put(ThemeController());

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((val) {
      navigationPage();
    });
  }

  navigationPage() async {
    if (connectionManagerController.connectionType.value != 0) {
      Get.to(NewsPage());
    } else {
      Get.snackbar(
        'No Internet Connection',
        'Please check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'News'.tr, size: 20, color: AppColors.primary),
              CustomText(
                  text: 'Flash'.tr,
                  size: 20,
                  color: themeController.isDark.value
                      ? AppColors.lightwhite
                      : AppColors.black)
            ],
          )
        ],
      ),
    );
  }
}
