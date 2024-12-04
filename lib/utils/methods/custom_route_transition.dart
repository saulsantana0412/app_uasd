import 'package:flutter/material.dart';

class CustomRouteTransition {
  // Método para realizar una transición de deslizamiento (slide) entre pantallas.
  static Route slideTransition(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination, // Define la pantalla de destino.
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Definición del inicio y fin de la animación de deslizamiento.
        const begin = Offset(1.0, 0.0); // La animación comienza desde la derecha.
        const end = Offset.zero; // La animación termina en la posición original.
        const curve = Curves.ease; // Curva de la animación (suaviza el movimiento).

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve)); // Se aplica la curva a la animación.
        var offsetAnimation = animation.drive(tween); // Se define la animación de desplazamiento.

        // Se retorna la transición de deslizamiento con la animación aplicada.
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
