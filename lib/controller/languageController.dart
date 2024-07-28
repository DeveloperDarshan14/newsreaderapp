import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var currentLanguage = 'English'.obs;
  var languages = ['English', 'Spanish'].obs;

  @override
  void onInit() {
    super.onInit();
    loadLanguagePreference();
  }

  void changeLanguage(String newLanguage) async {
    currentLanguage.value = newLanguage;
    var locale = _getLocaleFromLanguage(newLanguage);
    Get.updateLocale(locale);
    await saveLanguagePreference(newLanguage);
  }

  Locale _getLocaleFromLanguage(String language) {
    switch (language) {
      case 'Spanish':
        return Locale('sp', 'Spanish');
      case 'English':
      default:
        return Locale('en', 'US');
    }
  }

  void loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language');
    if (language != null && languages.contains(language)) {
      currentLanguage.value = language;
      var locale = _getLocaleFromLanguage(language);
      Get.updateLocale(locale);
    } else {
      currentLanguage.value = languages.first;
      Get.updateLocale(Locale('en', 'US'));
    }
  }

  Future<void> saveLanguagePreference(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }
}
