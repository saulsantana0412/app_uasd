import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/app_text_style.dart';


ThemeData appTheme = ThemeData(
  primaryColor: AppColors.darkblue,
  highlightColor: AppColors.yellow,
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Roboto',

  textTheme: TextTheme(
    bodySmall: AppTextStyles.bodySmall,
    bodyMedium: AppTextStyles.bodyMedium,
    bodyLarge: AppTextStyles.bodyLarge,
    // displaySmall: AppTextStyles.displaySmall,
    // displayMedium: AppTextStyles.displayMedium,
    // displayLarge: AppTextStyles.bodyLarge,
    titleSmall: AppTextStyles.titleSmall,
    titleMedium: AppTextStyles.titleMedium,
    titleLarge: AppTextStyles.titleLarge,
    labelSmall: AppTextStyles.labelSmall,
    labelMedium: AppTextStyles.labelMedium,
    labelLarge: AppTextStyles.labelLarge,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkblue,
    titleTextStyle: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
    foregroundColor: AppColors.white,
    centerTitle: true
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.darkblue,
    textTheme: ButtonTextTheme.primary,
  ),

  dividerColor: AppColors.ligthBlue, // Color de separadores
);