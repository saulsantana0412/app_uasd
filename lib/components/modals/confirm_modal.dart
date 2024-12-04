import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/outline_button.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Clase estática que muestra un modal de confirmación en la aplicación.
class ConfirmModal {

  /// Muestra un cuadro de diálogo de confirmación con un mensaje, pregunta, y botones de cancelación y continuación.
  static void show(
    BuildContext context, {
    required String message, // Mensaje que se muestra en el modal
    required String question, // Pregunta que se hace al usuario
    required String cancelButtonText, // Texto del botón de cancelación
    required String continueButtonText, // Texto del botón de continuación
    required VoidCallback onPressed, // Acción a realizar cuando se presiona el botón de continuar
  }) { 
    showDialog( 
      context: context,
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white, 
        icon: const Icon(Icons.question_mark, size: 50,), 
        iconColor: AppColors.darkblue, 
        title: Text(
          'Atención', 
          style: Theme.of(context).textTheme.titleLarge, 
          textAlign: TextAlign.center, 
        ), 
        content: IntrinsicHeight(
          child: Column(
            children: [
              Text(
                message, 
                style: Theme.of(context).textTheme.bodyLarge, 
                textAlign: TextAlign.center, 
              ),
              const SizedBox(height: 10,),
              Text(
                question, 
                style: Theme.of(context).textTheme.labelLarge, 
                textAlign: TextAlign.center, 
              ),
            ],
          ),
        ),  
        actionsAlignment: MainAxisAlignment.center, // Alineación de los botones
        actions: [
          IntrinsicWidth(
            child: Row(
              children: [
                OutlineButton(
                  text: cancelButtonText, // Texto del botón de cancelar
                  color: AppColors.darkblue,
                  onPressed: () {
                    Navigator.pop(context); // Cierra el modal si se cancela
                  }
                ),
                const SizedBox(width: 10,),
                SolidButton(
                  text: continueButtonText, // Texto del botón de continuar
                  backgroundColor: AppColors.darkblue, 
                  onPressed: onPressed, // Acción cuando se presiona el botón de continuar
                )
              ],
            ),
          )
        ], 
      ), 
    ); 
  } 
}