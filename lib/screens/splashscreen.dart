import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:newsreaderapp/screens/newspage.dart';

import '../utils/colors.dart';
import '../widgets/customtext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ThemeController themeController=Get.put(ThemeController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((val) {
     navigationPage();
    });
  }

  navigationPage() async{
   Get.to(NewsPage());
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
