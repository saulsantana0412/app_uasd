import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget de campo de texto personalizado con soporte para validación, iconos, y visibilidad de texto.
class TextInput extends StatefulWidget {
  final String label; // Etiqueta para el campo.
  final TextEditingController controller; // Controlador para el campo de texto.
  final String? Function(String?)? validator; // Función de validación del campo.
  final IconData? icon; // Icono opcional en el inicio del campo.
  final int minLines; // Número mínimo de líneas para el campo de texto.
  final int maxLines; // Número máximo de líneas para el campo de texto.
  final bool required; // Si el campo es obligatorio (aunque no se usa en este caso).
  final bool? obscureText; // Si el texto debe ser ocultado (para contraseñas).
  final bool enable; // Si el campo está habilitado o no.

  const TextInput({
    super.key, 
    required this.label,
    required this.controller,
    this.validator,
    this.icon,
    this.minLines = 1,
    this.maxLines = 1,
    this.required = false,
    this.obscureText,
    this.enable = true
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscureText = true; // Estado para la visibilidad del texto (ocultar/mostrar).
  final FocusNode _focusNode = FocusNode(); // Controla el foco del campo.

  @override
  void initState() {
    super.initState();
    if (widget.obscureText != null) {
      _obscureText = true; // Inicializa la visibilidad del texto si se ha pasado el parámetro.
    }
  }

  /// Valida si el campo tiene un valor.
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Favor completar este campo"; // Mensaje si el campo está vacío.
    }
    return null;
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Libera los recursos del FocusNode al destruir el widget.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: textTheme.bodyLarge,
          enabled: widget.enable, // Controla si el campo está habilitado.
          controller: widget.controller, // Controlador para el campo de texto.
          focusNode: _focusNode, // Asocia el foco al campo de texto.
          validator: widget.validator ?? _validateField, // Función de validación.
          minLines: widget.minLines, // Número mínimo de líneas.
          maxLines: widget.maxLines, // Número máximo de líneas.
          obscureText: widget.obscureText == null ? false : _obscureText, // Configura la visibilidad del texto.
          onTapOutside: (_) { _focusNode.unfocus(); }, // Desenfoca el campo si el usuario hace clic fuera de él.
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Icon(widget.icon), // Icono en el inicio del campo.
            suffixIcon: widget.obscureText == null ? null : IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                _obscureText = !_obscureText; // Alterna la visibilidad del texto.
                setState(() {}); // Actualiza el estado.
                // Desactiva la visibilidad después de 4 segundos.
                Timer(const Duration(seconds: 4), () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                });
              },
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGray),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkblue, width: 2),
            ),
            label: Text(widget.label), // Etiqueta que aparece arriba del campo.
            floatingLabelStyle: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            labelStyle: textTheme.labelLarge,
            errorStyle: textTheme.bodySmall?.copyWith(color: AppColors.red),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}