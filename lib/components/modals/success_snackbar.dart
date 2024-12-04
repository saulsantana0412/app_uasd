import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Clase estática para mostrar un snackbar de éxito.
class SuccessSnackbar {

  /// Muestra un snackbar de éxito con un mensaje.
  static void show(BuildContext context, String message) {

    TextTheme textTheme = Theme.of(context).textTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline_outlined, color: Colors.white,), 
            const SizedBox(width: 10,), 
            Flexible(
              child: Text(
                message, 
                style: textTheme.bodyMedium?.copyWith(color: AppColors.white), 
                softWrap: true, // Ajuste de línea
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.green, // Color de fondo del snackbar
        showCloseIcon: true, // Muestra el icono de cierre
        padding: const EdgeInsets.all(10), // Padding dentro del snackbar
      ), 
    );
  }
}