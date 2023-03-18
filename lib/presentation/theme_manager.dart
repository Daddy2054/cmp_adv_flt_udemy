import 'package:cmp_adv_flt_udemy/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
//main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,
//card view Theme:
//Appbar theme

//button theme

//text theme

//input decoration theme
  );
}
