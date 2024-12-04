import 'package:flutter/material.dart';

/// Botón con funcionalidad de expandir y colapsar que alterna entre dos íconos
/// y ejecuta una acción cuando se presiona.
class ExpandButton extends StatefulWidget {
  final String text; // Texto que acompaña al botón.
  final IconData icon; // Ícono mostrado cuando el estado es colapsado.
  final IconData icon2; // Ícono mostrado cuando el estado es expandido.
  final VoidCallback onPressed; // Acción a ejecutar al presionar el botón.
  final bool state; // Estado inicial del botón 

  const ExpandButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.icon2,
    required this.state,
    required this.text,
  });

  @override
  State<ExpandButton> createState() => _ExpandButtonState();
}

class _ExpandButtonState extends State<ExpandButton> {
  late IconData _icon; // Almacena el ícono actual del botón.
  late bool _state; // Estado actual del botón.

  /// Cambia el estado y alterna entre los íconos.
  void _onPressed() {
    setState(() {
      _state = !_state;
      _changeIcon();
    });
    widget.onPressed(); // Ejecuta la acción asignada al botón.
  }

  /// Alterna el ícono según el estado actual.
  void _changeIcon() {
    _icon = _state ? widget.icon2 : widget.icon;
  }

  @override
  void initState() {
    super.initState();
    _state = widget.state; // Configura el estado inicial.
    _changeIcon(); // Configura el ícono inicial.
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: _onPressed,
      child: Row(
        children: [
          Text(
            widget.text, // Muestra el texto del botón.
            style: textTheme.titleMedium,
          ),
          Icon(
            _icon, // Muestra el ícono según el estado actual.
            size: 28,
          ),
        ],
      ),
    );
  }
}