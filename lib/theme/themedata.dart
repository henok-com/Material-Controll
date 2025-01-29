import 'package:flutter/material.dart';
import 'package:matrial_controll/colors.dart';

final ThemeData lightTheme = ThemeData(
  canvasColor: AppColors.backgroundColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    inversePrimary: const Color.fromARGB(46, 0, 142, 83),
    onPrimary: AppColors.terinary,
    secondary: AppColors.secondary,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.red[300]!,
    surface: Colors.white,
    onSurface: AppColors.darkBlue,
    primaryContainer: Colors.white,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStatePropertyAll(Color.fromARGB(66, 0, 142, 83)),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  canvasColor: AppColors.darkBackgroundColor,
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    inversePrimary: const Color.fromARGB(98, 0, 142, 83),
    onPrimary: AppColors.terinary,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red[300]!,
    surface: AppColors.darkerBackgroundColor,
    onSurface: AppColors.lightBlue,
    primaryContainer: AppColors.darkerBackgroundColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStatePropertyAll(Color.fromARGB(66, 0, 142, 83)),
    ),
  ),
);
