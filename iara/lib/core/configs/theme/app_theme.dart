import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Nunito',
    primaryColor: Color(AppColors.primaryPurple),
    scaffoldBackgroundColor: Color(AppColors.white),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(AppColors.primaryPurple),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    textTheme: lightTextTheme,
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Nunito',
    primaryColor: Color(AppColors.primaryPurple),
    scaffoldBackgroundColor: Color(AppColors.black),
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(AppColors.primaryPurple),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    textTheme: darkTextTheme,
  );

  static final darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: Color(AppColors.white),
    ),

    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Color(AppColors.white),
    ),

    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(AppColors.white),
    ),
  );

  static final lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: Color(AppColors.black),
    ),

    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Color(AppColors.black),
    ),

    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(AppColors.black),
    ),
  );
}

extension TextThemeExtension on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
}
