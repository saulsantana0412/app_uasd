import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Botón sólido con texto, color de fondo personalizable y acción al presionar.
class SolidButton extends StatelessWidget {
  final String text; // Texto del botón.
  final Color? backgroundColor; // Color de fondo del botón. 
  final VoidCallback onPressed; // Acción a ejecutar al presionar el botón.

  const SolidButton({super.key, required this.text, required this.onPressed, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context); // Obtiene el tema del contexto.

    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centra el botón en la fila.
      children: [
        TextButton(
          onPressed: onPressed, // Ejecuta la acción cuando se presiona el botón.
          style: TextButton.styleFrom(
            textStyle: theme.textTheme.labelMedium, // Estilo del texto 
            foregroundColor: AppColors.white, 
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Espaciado dentro del botón.
            backgroundColor: backgroundColor ?? AppColors.darkblue, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), 
            ),
          ),
          child: Text(text), // Texto mostrado en el botón.
        ),
      ],
    );
  }
}