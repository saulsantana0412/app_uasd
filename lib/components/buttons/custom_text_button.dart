import 'package:flutter/material.dart';

/// Un botón de texto personalizado que puede incluir un ícono opcional y permite 
/// ejecutar una función al ser presionado.
class CustomTextButton extends StatelessWidget {
  final String text; // Texto que se mostrará en el botón.
  final IconData? icon; // Ícono opcional que puede acompañar al texto.
  final VoidCallback onPressed; // Acción que se ejecutará al presionar el botón.
  final Color? color; // Color personalizado para el texto y el ícono.

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onPressed, // Ejecuta la acción asignada al botón.
        splashColor: Colors.transparent, 
        child: Row(
          children: [
            Text(
              text, // Muestra el texto con estilo y color personalizado.
              style: textTheme.labelMedium?.copyWith(color: color),
            ),
            if (icon != null) // Muestra el ícono si está definido.
              Icon(icon, color: color),
          ],
        ),
      ),
    );
  }
}