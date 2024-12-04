import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/event_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart'; 
import 'package:uasd_app/models/event.dart'; 
import 'package:uasd_app/services/content_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> _events = []; // Lista para almacenar los eventos obtenidos.
  bool _loading = true; // Indicador de carga.

  // Método para obtener los eventos desde el servicio de contenido.
  Future <void> fetchEvents() async {
    final data = await ContentService.fetchEvents(); // Llamada al servicio.
    if (data != null && mounted) { // Si los datos no son nulos y el widget sigue montado.
      _events = data; // Asigna los eventos obtenidos.
      setState(() {
        _loading = false; // Cambia el estado de carga.
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEvents(); // Llama al método para obtener los eventos cuando se inicializa la pantalla.
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme; // Obtiene el tema de texto actual.

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor, // Color de fondo.
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Eventos", style: textTheme.titleMedium), // Título de la pantalla.
          const SizedBox(height: 10),
          
          // Si está cargando, muestra el indicador de carga.
          if (_loading) const CustomCircularProgress(),
          
          // Si ya se cargaron los eventos pero no hay eventos, muestra un mensaje.
          if (!_loading && _events.isEmpty) 
            Text("No hay eventos en calendario.", style: Theme.of(context).textTheme.bodyMedium),
            
          // Si se cargaron eventos, muestra la lista de eventos.
          if (!_loading && _events.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _events.length, // El número de eventos es la cantidad de elementos en la lista.
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventCard(event: _events[index]), // Componente que muestra la información de cada evento.
                      const SizedBox(height: 20), // Espaciado entre los eventos.
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
