import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart'; // Archivo que define los colores personalizados de la app.
import 'package:uasd_app/utils/app_text_style.dart'; // Archivo que define los estilos de texto personalizados.

// Definición del tema principal de la aplicación.
ThemeData appTheme = ThemeData(
  primaryColor: AppColors.darkblue, // Color principal de la aplicación.
  scaffoldBackgroundColor: AppColors.white, // Color de fondo de los scaffolds.
  fontFamily: 'Roboto', // Familia de fuente global de la aplicación.

  // Definición de los estilos de texto personalizados.
  textTheme: TextTheme(
    bodySmall: AppTextStyles.bodySmall, // Estilo para textos pequeños del cuerpo.
    bodyMedium: AppTextStyles.bodyMedium, // Estilo para textos medianos del cuerpo.
    bodyLarge: AppTextStyles.bodyLarge, // Estilo para textos grandes del cuerpo.
    titleSmall: AppTextStyles.titleSmall, // Estilo para títulos pequeños.
    titleMedium: AppTextStyles.titleMedium, // Estilo para títulos medianos.
    titleLarge: AppTextStyles.titleLarge, // Estilo para títulos grandes.
    labelSmall: AppTextStyles.labelSmall, // Estilo para etiquetas pequeñas.
    labelMedium: AppTextStyles.labelMedium, // Estilo para etiquetas medianas.
    labelLarge: AppTextStyles.labelLarge, // Estilo para etiquetas grandes.
  ),

  // Configuración personalizada para la barra de la aplicación (AppBar).
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkblue, // Color de fondo del AppBar.
    titleTextStyle: AppTextStyles.titleMedium.copyWith(
      color: AppColors.white, // Color del texto en el título del AppBar.
    ),
    foregroundColor: AppColors.white, // Color de los íconos en el AppBar.
    centerTitle: true, // Centrar el título en el AppBar.
  ),

  // Configuración para botones.
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.darkblue, // Color de los botones.
    textTheme: ButtonTextTheme.primary, // Tema de texto dentro de los botones.
  ),

  // Color para divisores (líneas separadoras).
  dividerColor: AppColors.ligthBlue, // Color de las divisores en la UI.
);
