import 'package:flutter/material.dart';

// Este widget personalizado es un botón que puede alternar entre dos íconos 
// y estados si se configura de esa manera. También ejecuta una acción personalizada 
// al ser presionado.
class CustomIconButton extends StatefulWidget {
  final IconData icon; // Ícono principal
  final VoidCallback onPressed; // Acción a ejecutar al presionar el botón
  final IconData? icon2; // Segundo ícono opcional para alternar
  final bool? state; // Estado inicial del botón (true o false)

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.icon2,
    this.state,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  late IconData _icon; 
  bool? _state; 

  // Cambia el estado y el ícono del botón al ser presionado
  void _onPressed() {
    if (_state != null) {
      setState(() {
        _state = !_state!; // Alterna el estado entre true y false
        _changeIcon(); // Actualiza el ícono según el nuevo estado
      });
    }
    widget.onPressed(); // Ejecuta la acción pasada como parámetro
  }

  // Cambia el ícono actual según el estado
  void _changeIcon() {
    _icon = (_state == false ? widget.icon : widget.icon2)!;
  }

  @override
  void initState() {
    super.initState();
    _state = widget.state; // Configura el estado inicial
    if (_state != null) {
      _changeIcon(); // Configura el ícono inicial según el estado
    } else {
      _icon = widget.icon; // Usa el ícono principal si no hay estado
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed, // Ejecuta la acción al presionar el botón
      child: Icon(
        _icon,
        size: 28, // Tamaño del ícono
      ),
    );
  }
}