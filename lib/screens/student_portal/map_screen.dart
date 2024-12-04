import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; 
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/methods/launch_url.dart'; 

class MapScreen extends StatefulWidget {

  final String coordenates; // Coordenadas para ubicar el marcador en el mapa.
  final String? title; // Título opcional para mostrar en el marcador.
  final String? description; // Descripción opcional para mostrar en el marcador.

  const MapScreen({super.key, required this.coordenates, this.title, this.description}); // Constructor para la pantalla del mapa.

  @override
  State<MapScreen> createState() => _MapScreenState(); // Estado de la pantalla del mapa.
}

class _MapScreenState extends State<MapScreen> {

  double _latitude = 0; // Latitud inicial.
  double _longitude = 0; // Longitud inicial.

  @override
  void initState() {
    super.initState();
    // Se extraen las coordenadas desde el string pasado y se asignan a latitud y longitud.
    _latitude = double.parse(widget.coordenates.split(",")[0]);
    _longitude = double.parse(widget.coordenates.split(",")[1].trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"), // Título de la pantalla.
      ),
      body: GoogleMap(
        // Configura el comportamiento del mapa.
        scrollGesturesEnabled: true, // Habilita el desplazamiento con gestos.
        zoomGesturesEnabled: true, // Habilita el zoom con gestos.
        rotateGesturesEnabled: true, // Habilita la rotación con gestos.
        tiltGesturesEnabled: true, // Habilita la inclinación con gestos.
        initialCameraPosition: CameraPosition(
          target: LatLng(_latitude, _longitude), // Establece la posición inicial del mapa.
          zoom: 18 // Establece el nivel de zoom inicial.
        ),
        markers: {
          // Agrega un marcador en las coordenadas proporcionadas.
          Marker(
            markerId: const MarkerId("marker"), // ID del marcador.
            position: LatLng(_latitude, _longitude), // Posición del marcador.
            onTap: () => showDialog(
              context: context, 
              builder: (context) => 
              AlertDialog(
                title: Text(widget.title ?? ""), // Muestra el título si está disponible.
                content: Text(widget.description ?? ""), // Muestra la descripción si está disponible.
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cerrar")) // Botón para cerrar el cuadro de diálogo.
                ],
              ),
            )
          )
        },
      ),
      // Botón flotante que permite abrir las coordenadas en Google Maps.
      floatingActionButton: SolidButton(
        text: "Abrir en Maps", 
        onPressed: () {
          Launch.url("https://www.google.com/maps/search/?api=1&query=$_latitude,$_longitude"); // Abre Google Maps con las coordenadas.
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Posiciona el botón flotante en el centro inferior de la pantalla.
    );
  }
}
