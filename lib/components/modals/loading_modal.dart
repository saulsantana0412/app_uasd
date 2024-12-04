import 'package:flutter/material.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Clase estática para mostrar un modal de carga.
class LoadingModal {

  /// Muestra un modal de carga con un mensaje.
  static void show(BuildContext context, String message) { 
    showDialog( 
      context: context, 
      barrierDismissible: false, // No se puede cerrar el modal tocando fuera de él
      builder: (context) => AlertDialog( 
        backgroundColor: AppColors.white,
        icon: const Icon(Icons.hourglass_empty, size: 50,), // Icono de espera (reloj de arena)
        iconColor: AppColors.blue, // Color del icono
        title: Text(
          'Procesando', 
          style: Theme.of(context).textTheme.titleLarge, 
          textAlign: TextAlign.center,
        ), // Título del modal
        content: Column( 
          mainAxisSize: MainAxisSize.min, // Tamaño mínimo del modal
          children: [ 
            Text(
              message, 
              style: Theme.of(context).textTheme.bodyMedium, 
              textAlign: TextAlign.center,
            ), // Mensaje personalizado
            const CustomCircularProgress(), // Indicador de carga circular
          ], 
        ),
      ),
    ); 
  }
}