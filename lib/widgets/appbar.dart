import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:newsreaderapp/screens/settingspage.dart';

import '../utils/colors.dart';
import 'customtext.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  TopAppBar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  ThemeController themeController = Get.put(ThemeController());

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined,
                color:
                    themeController.isDark.value ? Colors.white : Colors.black),
            onPressed: () {
              // Handle settings button press
              Get.to(SettingsPage());
            },
          ),
        ],
        backgroundColor:
            themeController.isDark.value ? AppColors.black : AppColors.white,
        elevation: 0,
        title: Container(
            height: 40,
            child: Row(
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
            )),
        centerTitle: true,
      ),
    );
  }
}
