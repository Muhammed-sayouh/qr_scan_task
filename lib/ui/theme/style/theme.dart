import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData getTheme() {
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: const TextStyle(color: AppColors.lightGrayColor),
      
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.grey[300] as Color
            ,
          ),
          borderRadius: BorderRadius.circular(4)),
      enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.grey[300] as Color
          ),
          borderRadius: BorderRadius.circular(4)),
          errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redColor,
          ),
          borderRadius: BorderRadius.circular(4)),
          focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redColor,
          ),
          borderRadius: BorderRadius.circular(4)),
    ),
  );
}
