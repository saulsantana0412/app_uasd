import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/components/modals/confirm_modal.dart';
import 'package:uasd_app/models/task.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

/// Widget que muestra la tarjeta de una tarea con su información y acciones.
class TaskCard extends StatelessWidget {
  final Task task; // La tarea que se mostrará en la tarjeta.

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme; 

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white, // Fondo blanco de la tarjeta.
        borderRadius: BorderRadius.circular(10), 
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Asegura que los bordes sean redondeados en el contenido.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación de los elementos a la izquierda.
          children: [
            // Fila de estado de la tarea (Pendiente o Completada).
            Container(
              decoration: BoxDecoration(
                color: !task.completada ? AppColors.blue : AppColors.yellow, // Color dependiendo si la tarea está completada o no.
              ),
              child: Container(
                padding: const EdgeInsets.all(7), // Espaciado interno.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Text(
                      !task.completada ? "Pendiente" : "Completada", 
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      !task.completada ? Icons.remove_circle_outline : Icons.check_circle_outline_outlined, 
                      size: 20, // Icono que indica si la tarea está pendiente o completada.
                    ),
                  ],
                ),
              ),
            ),
            // Contenedor con detalles de la tarea (título y descripción).
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaciado interno.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(task.titulo, style: textTheme.titleMedium), // Muestra el título de la tarea.
                  const SizedBox(height: 5),
                  Text(task.descripcion, style: textTheme.bodyMedium), // Muestra la descripción de la tarea.
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Contenedor con la fecha de vencimiento de la tarea.
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20), // Márgenes horizontales.
              padding: const EdgeInsets.all(5), // Espaciado interno.
              decoration: BoxDecoration(
                color: AppColors.ligthBlue, 
                borderRadius: BorderRadius.circular(20), // Bordes redondeados.
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Alineación centrada de los elementos.
                children: [
                  Text("Fecha de Venc. : ", style: textTheme.labelMedium), // Muestra el texto "Fecha de Venc."
                  Text(
                    task.fechaVencimiento.toString().split(".")[0], 
                    style: textTheme.bodyMedium,
                  ), // Muestra la fecha de vencimiento de la tarea.
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Botón que realiza una acción dependiendo si la tarea está pendiente o completada.
            SolidButton(
              text: !task.completada ? "Agregar Entrega" : "Ver Entrega", 
              onPressed: () {
                // Muestra un modal de confirmación para redirigir al usuario.
                ConfirmModal.show(
                  context, 
                  message: "Se te redirigirá a una página externa.", 
                  question: "¿Quieres continuar?", 
                  cancelButtonText: "No", 
                  continueButtonText: "Sí", 
                  onPressed: () {
                    Navigator.pop(context); // Cierra el modal.
                    Launch.url("https://soft.uasd.edu.do/UASDVirtualGateway/"); // Abre la URL de la página externa.
                  }
                );
              }
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}