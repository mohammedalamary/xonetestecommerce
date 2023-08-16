import 'package:x_one_test/core/theme/phone_theme/app_phone_theme.dart';
import 'package:x_one_test/core/theme/tap_theme/app_taplate_theme.dart';
import 'package:x_one_test/core/theme/text_font_family.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/responsbal_screen_size_helper.dart';
import 'disk_top_theme/app_disk_top_theme.dart';

class ThemeService {
  ThemeService._();
  static ThemeData lightTheme = ThemeData(fontFamily:AppFonts.cairo);
  static ThemeData darkTheme = ThemeData(fontFamily:AppFonts.cairo);
  static getTheme() async {
    if (ResponsiveSize.isSmallScreen()) {
      lightTheme = CustomLightPhoneTheme.lightTheme;
      darkTheme = CustomDarkPhoneTheme.darkTheme;
    } else if (ResponsiveSize.isMediumScreen()) {
      lightTheme = CustomLightTapTheme.lightTheme;
      darkTheme = CustomDarkTapTheme.darkTheme;
    } else if (ResponsiveSize.isLargeScreen()) {
      lightTheme = CustomLightDiskTopTheme.lightTheme;
      darkTheme = CustomDarkDiskTopTheme.darkTheme;
    }
  //   if (!await UserSelectedThemeStorage().getLocal()) {
  //     Get.changeTheme(lightTheme);
  //   } else {
  //     Get.changeTheme(darkTheme);
  //   }
  // }
  // static switchTheme() async {
  //   if (await UserSelectedThemeStorage().getLocal()) {
  //     await UserSelectedThemeStorage().saveLocal(data: false);
  //     Get.changeTheme(lightTheme);
  //   } else {
  //     await UserSelectedThemeStorage().saveLocal(data: true);
  //     Get.changeTheme(darkTheme);
  //   }
  }
}
