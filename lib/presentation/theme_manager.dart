import 'package:cmp_adv_flt_udemy/presentation/color_manager.dart';
import 'package:cmp_adv_flt_udemy/presentation/font_manager.dart';
import 'package:cmp_adv_flt_udemy/presentation/styles_manager.dart';
import 'package:flutter/material.dart';

import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
//main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,
    //ripple color
    splashColor: ColorManager.primaryOpacity70,
//card view Theme:

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
//Appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

//button theme

//text theme

//input decoration theme
  );
}
