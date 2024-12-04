import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

// Este widget crea un pequeño botón flotante con un ícono que abre un enlace externo,
// mostrando previamente un cuadro de diálogo de confirmación.
class CustomIconButtonSmall extends StatelessWidget {
  final String url; // URL a la que se redirigirá al usuario
  const CustomIconButtonSmall({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Posiciona el botón en la esquina superior derecha
      top: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(10), // Margen alrededor del botón
        width: 35,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.yellow, // Color de fondo del botón
          borderRadius: BorderRadius.circular(5), // Bordes redondeados
        ),
        child: CustomIconButton(
          icon: Icons.link, 
          onPressed: () {
            // Al presionar el botón, muestra un cuadro de diálogo de confirmación
            ConfirmModal.show(
              context,
              message: "Se te redirigirá a una página externa.", // Mensaje informativo
              question: "¿Quieres continuar?", // Pregunta de confirmación
              cancelButtonText: "No", 
              continueButtonText: "Sí", 
              onPressed: () {
                Navigator.pop(context); // Cierra el cuadro de diálogo
                Launch.url(url); // Lanza la URL proporcionada
              },
            );
          },
        ),
      ),
    );
  }
}