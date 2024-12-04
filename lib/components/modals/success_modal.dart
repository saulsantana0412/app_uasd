import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Clase estática para mostrar un modal de éxito.
class SuccessModal {

  /// Muestra un modal de éxito con un mensaje.
  static void show(BuildContext context, String message) { 
    showDialog( 
      context: context, 
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.check_circle_outline_outlined, size: 50,), // Icono de (check)
        iconColor: AppColors.green, 
        title: Text(
          '¡Éxito!', 
          style: Theme.of(context).textTheme.titleLarge, 
          textAlign: TextAlign.center,
        ), // Título del modal
        content: Text(
          message, 
          style: Theme.of(context).textTheme.bodyLarge, 
          textAlign: TextAlign.center,
        ), // Mensaje personalizado
        actionsAlignment: MainAxisAlignment.center, 
        actions: [
          IntrinsicWidth(
            child: SolidButton(
              text: "Cerrar", 
              backgroundColor: AppColors.green, // Color del botón
              onPressed: () {
                Navigator.pop(context); // Cierra el modal
              }
            ),
          )
        ],
      ), 
    ); 
  }
}