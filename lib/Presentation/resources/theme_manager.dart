import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: ColorManager.primery,
          ),
      primaryColorLight: ColorManager.primeryOpacity70,
      primaryColorDark: ColorManager.darkPrimery,
      disabledColor: ColorManager.grey1,
      //ripple color
      splashColor: ColorManager.primeryOpacity70,
      accentColor: ColorManager.grey,

      // card theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: appSize.s4),

      // app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primery,
          shadowColor: ColorManager.primeryOpacity70,
          elevation: appSize.s4,
          titleTextStyle: getRegulerStyle(
              color: ColorManager.white, fontsize: appSize.s16)),
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          buttonColor: ColorManager.primery,
          splashColor: ColorManager.primeryOpacity70,
          disabledColor: ColorManager.grey1),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: appSize.s2,
              textStyle: getRegulerStyle(color: ColorManager.white),
              primary: ColorManager.primery,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(appSize.s12)))),
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontsize: FontSize.s16),
          headline2: getRegulerStyle(
              color: ColorManager.white, fontsize: FontSize.s16),
          headline3:
              getBoldStyle(color: ColorManager.primery, fontsize: FontSize.s18),
          headline4: getRegulerStyle(
              color: ColorManager.primery, fontsize: FontSize.s14),
          subtitle1:
              getRegulerStyle(color: ColorManager.black, fontsize: appSize.s14),
          subtitle2: getRegulerStyle(
              color: ColorManager.primery, fontsize: appSize.s14),
          caption: getRegulerStyle(color: ColorManager.grey1),
          bodyText1: getRegulerStyle(color: ColorManager.grey)),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle:
              getRegulerStyle(color: ColorManager.grey, fontsize: FontSize.s14),
          labelStyle: getMediumStyle(color: ColorManager.black),
          errorStyle: getRegulerStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appSize.s6),
            borderSide:
                BorderSide(color: ColorManager.grey, width: appSize.s1_5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appSize.s6),
            borderSide:
                BorderSide(color: ColorManager.primery, width: appSize.s1_5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appSize.s6),
            borderSide:
                BorderSide(color: ColorManager.error, width: appSize.s1_5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appSize.s6),
            borderSide:
                BorderSide(color: ColorManager.primery, width: appSize.s1_5),
          )));
}
