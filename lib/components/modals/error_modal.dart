import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Clase estática para mostrar un modal de error.
class ErrorModal {

  /// Muestra un cuadro de diálogo de error con un mensaje específico.
  static void show(BuildContext context, String message) { 
    showDialog( 
      context: context,
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.error_outline, size: 50,), 
        iconColor: AppColors.red,
        title: Text(
          'Error', 
          style: Theme.of(context).textTheme.titleLarge, 
          textAlign: TextAlign.center, // Alineación del título
        ), 
        content: Text(
          message, 
          style: Theme.of(context).textTheme.bodyLarge, 
          textAlign: TextAlign.center, // Alineación del mensaje de error
        ),  
        actionsAlignment: MainAxisAlignment.center, // Alineación de los botones
        actions: [
          IntrinsicWidth(
            child: SolidButton(
              text: "Cerrar", // Texto del botón para cerrar
              backgroundColor: AppColors.red, // Color de fondo del botón
              onPressed: () {
                Navigator.pop(context); // Cierra el modal cuando se presiona el botón
              }
            ),
          )
        ], 
      ), 
    ); 
  } 
}