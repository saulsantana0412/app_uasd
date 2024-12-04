import 'package:flutter/material.dart';
import 'package:uasd_app/models/request_type.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget que muestra un campo desplegable (dropdown) con opciones.
class DropdownInput extends StatefulWidget {
  final String label; // Etiqueta que se muestra en el campo.
  final String? value; // Valor seleccionado (código del item).
  final List<RequestType> items; // Lista de elementos que se mostrarán en el dropdown.
  final ValueChanged<String?> onChanged; // Función que se llama cuando cambia el valor seleccionado.
  final String? Function(String?)? validator; // Función de validación del campo.
  final IconData? icon; // Icono opcional para el campo.
  final bool enable; // Si el campo está habilitado o no.

  const DropdownInput({super.key, 
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
  String? _selectedValue; // Valor actualmente seleccionado.

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value; // Inicializa el valor seleccionado con el valor recibido.
  }

  /// Valida si el campo tiene un valor seleccionado.
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Favor seleccionar una opción"; // Mensaje de error si no se selecciona un valor.
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
          value: _selectedValue, // Valor seleccionado actual.
          style: textTheme.bodyLarge, 
          items: widget.items.map((RequestType item) {
            return DropdownMenuItem<String>(
              value: item.codigo, // El valor que se seleccionará al elegir el item.
              child: Text(item.descripcion), // Descripción que se muestra en el dropdown.
            );
          }).toList(),
          onChanged: widget.enable ? (value) { // Si el campo está habilitado, permite seleccionar un nuevo valor.
            setState(() {
              _selectedValue = value; // Actualiza el valor seleccionado.
            });
            widget.onChanged(value); // Llama a la función onChanged para notificar el cambio.
          } : null,
          validator: widget.validator ?? _validateField, // Usa la función de validación proporcionada o la predeterminada.
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Icon(widget.icon), // Muestra el icono si se proporciona.
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGray), 
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkblue, width: 2), 
            ),
            label: Text(widget.label), // Etiqueta que se muestra arriba del campo.
            floatingLabelStyle: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800), // Estilo del texto de la etiqueta flotante.
            labelStyle: textTheme.labelLarge, 
            errorStyle: textTheme.bodySmall?.copyWith(color: AppColors.red), // Estilo del mensaje de error.
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red), // Borde cuando hay un error.
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2), // Borde cuando hay un error y el campo está enfocado.
            ),
          ),
        ),
      ],
    );
  }
}