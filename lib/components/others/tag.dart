import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

class Tag extends StatelessWidget {
  final String text; // Texto que se va a mostrar dentro del tag

  const Tag({super.key, required this.text}); // Constructor que recibe el texto

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context); // Obtiene el tema actual de la aplicación

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Padding alrededor del texto
      decoration: BoxDecoration(
        color: AppColors.blue, 
        borderRadius: BorderRadius.circular(20), 
      ),
      child: Text(
        text, // El texto que se pasa al tag
        style: theme.textTheme.labelMedium, // Estilo del texto según el tema
      ),
    );
  }
}