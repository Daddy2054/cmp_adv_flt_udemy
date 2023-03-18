import 'package:cmp_adv_flt_udemy/presentation/color_manager.dart';
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
//card view Theme:

      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
//Appbar theme

//button theme

//text theme

//input decoration theme
      );
}
