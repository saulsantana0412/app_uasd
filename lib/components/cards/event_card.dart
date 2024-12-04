import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/models/event.dart';
import 'package:uasd_app/screens/student_portal/map_screen.dart';
import 'package:uasd_app/utils/app_colors.dart';

/// Widget que muestra una tarjeta con la información de un evento.
class EventCard extends StatelessWidget {
  final Event event; // El evento que se va a mostrar en la tarjeta.

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto del contexto.

    return Container(
      padding: const EdgeInsets.all(20), // Espaciado interno de la tarjeta.
      decoration: BoxDecoration(
        color: AppColors.white, 
        borderRadius: BorderRadius.circular(10), 
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGray.withOpacity(.05), // Sombra sutil en la tarjeta.
            blurRadius: 10, 
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alineación de los elementos en columna.
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacio entre el título y el botón.
            children: [
              Text(event.titulo, style: textTheme.titleMedium), 
              CustomIconButton(
                icon: Icons.location_on_outlined, 
                onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    // Navega a la pantalla del mapa con las coordenadas del evento.
                    return MapScreen(coordenates: event.coordenadas); 
                  }));
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(event.descripcion, style: textTheme.bodyMedium), // Descripción del evento.
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Alineación de la fila.
            children: [
              Text("Fecha Evento : ", style: textTheme.labelMedium), // Etiqueta de fecha.
              Text(event.fechaEvento.toString().split(".")[0], style: textTheme.bodyMedium), // Muestra la fecha del evento.
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Alineación de la fila.
            children: [
              Text("Lugar: ", style: textTheme.labelMedium), // Etiqueta de lugar.
              Text(event.lugar.toString().split(".")[0], style: textTheme.bodyMedium), // Muestra el lugar del evento.
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}