import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clon_app/shared/constants/colors.dart';

final ligthTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: "tiktoksan",
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: const TextStyle().copyWith(
      fontSize: 49,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: "tiktoksan",
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 39,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "proximanova",
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 31,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "proximanova",
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "proximanova",
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "proximanova",
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: "proximanova",
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: "tiktoksan",
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 13,
      color: AppColors.grey0,
      fontWeight: FontWeight.normal,
      fontFamily: "tiktoksan",
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: "proximanova",
    ),
  ),
);
