import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Clase estática para mostrar un Snackbar de error.
class ErrorSnackbar {

  /// Muestra un Snackbar con un mensaje de error.
  static void show(BuildContext context, String message) {

    // Obtener el tema de texto actual de la aplicación
    TextTheme textTheme = Theme.of(context).textTheme;

    // Mostrar el SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            // Icono de error
            const Icon(Icons.error, color: Colors.white,),
            const SizedBox(width: 10,),
            // Texto del mensaje de error
            Flexible(
              child: Text(
                message, 
                style: textTheme.bodyMedium?.copyWith(color: AppColors.white),
                softWrap: true, // Permite que el texto se ajuste a múltiples líneas si es necesario
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.red, // Color de fondo del SnackBar
        showCloseIcon: true, // Muestra el ícono para cerrar el SnackBar
        padding: const EdgeInsets.all(10), // Espaciado interno del SnackBar
      ),
    );
  }
}