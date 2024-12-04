import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Botón de tipo "outline" con texto, color personalizable y acción al presionar.
class OutlineButton extends StatelessWidget {
  final String text; // Texto del botón.
  final Color? color; // Color del borde y texto del botón. 
  final VoidCallback onPressed; // Acción a ejecutar al presionar el botón.

  const OutlineButton({super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto del contexto.

    return TextButton(
      onPressed: onPressed, // Ejecuta la acción cuando se presiona el botón.
      style: TextButton.styleFrom(
        textStyle: textTheme.labelMedium, 
        foregroundColor: color ?? AppColors.darkGray, // Color del texto y borde.
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Espaciado dentro del botón.
        backgroundColor: Colors.transparent, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), 
          side: BorderSide(color: color ?? AppColors.darkGray, width: 2), 
        ),
      ),
      child: Text(text), // Texto mostrado en el botón.
    );
  }
}