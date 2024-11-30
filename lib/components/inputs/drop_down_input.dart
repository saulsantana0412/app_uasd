import 'package:flutter/material.dart';
import 'package:uasd_app/models/request_type.dart';
import 'package:uasd_app/utils/app_colors.dart';

class DropdownInput extends StatefulWidget {
  final String label;
  final String? value; // Valor seleccionado (el código)
  final List<RequestType> items; // Lista de RequestType
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool enable;

  const DropdownInput({
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.icon,
    this.enable = true,
  });

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  // Controla el foco del campo
  
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Favor seleccionar una opción";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: widget.value,
          style: textTheme.bodyLarge,
          items: widget.items.map((RequestType item) {
            return DropdownMenuItem<String>(
              value: item.codigo, // El valor que se seleccionará
              child: Text(item.descripcion), // Lo que se muestra en la lista
            );
          }).toList(),
          onChanged: widget.enable ? widget.onChanged : null,
          validator: widget.validator ?? _validateField,
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Icon(widget.icon),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGray),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkblue, width: 2),
            ),
            label: Text(widget.label),
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