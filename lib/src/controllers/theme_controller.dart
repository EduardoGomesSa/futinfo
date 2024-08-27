import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();

    _loadThemeFromPreferences();
  }

  void toggleTheme() async {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPreferences();
  }

  void _loadThemeFromPreferences() async {
    String? theme = await AppUtils().getLocalData(key: 'theme');

    if (theme != null) {
      themeMode.value = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void _saveThemeToPreferences() async {
    AppUtils().saveLocalData(
        key: 'theme',
        data: themeMode.value == ThemeMode.dark ? 'dark' : 'light');
  }
}
