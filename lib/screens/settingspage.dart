import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:newsreaderapp/widgets/components.dart';

import '../controller/languageController.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    final LanguageController languageController = Get.put(LanguageController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            "Settings".tr,
            style: TextStyle(color: themeController.textColor, fontSize: 20),
          ),
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            ListTile(
              leading: themeController.isDark.value
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode),
              title: themeController.isDark.value
                  ? Text("Dark theme".tr,style: TextStyle(
                  color: themeController.textColor,
                  fontSize: 16
              ),)
                  : Text("Light theme".tr,style: TextStyle(
                  color: themeController.textColor,
                  fontSize: 16
              ),),
              trailing: Switch(
                value: themeController.isDark.value,
                onChanged: (value) {
                  themeController.changeTheme();
                },
              ),
            ),
            DividerWidget(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Change Language".tr,style: TextStyle(
                color: themeController.textColor,
                fontSize: 16
              ),),
              trailing: Obx(() {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0), // Add padding from the left
                  child: DropdownButton<String>(
                    value: languageController.currentLanguage.value,
                    elevation: 16,
                    style: TextStyle(
                      color: themeController.isDark.value ? Colors.white : Colors.black,
                    ),
                    underline:null,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        languageController.changeLanguage(newValue);
                      }
                    },
                    items: languageController.languages
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(
                            color: themeController.textColor,
                            fontSize: 16
                        ),),
                      );
                    }).toList(),
                  ),
                );
              }),
            ),

            DividerWidget(),
          ],
        );
      }),
    );
  }
}
