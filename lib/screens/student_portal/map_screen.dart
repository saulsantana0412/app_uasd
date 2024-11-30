import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uasd_app/components/buttons/solid_button.dart';
import 'package:uasd_app/utils/methods/launch_url.dart';

class MapScreen extends StatefulWidget {

  final String coordenates;
  final String? title;
  final String? description; 

  const MapScreen({super.key, required this.coordenates, this.title, this.description});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  double _latitude = 0;
  double _longitude = 0;

  @override
  void initState() {
    super.initState();
    _latitude = double.parse(widget.coordenates.split(",")[0]);
    _longitude = double.parse(widget.coordenates.split(",")[1].trim());
  
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
      ),
      body: GoogleMap(
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(_latitude, _longitude),
          zoom: 18
          ),
          markers: {
            Marker(
              markerId: MarkerId("marker"),
              position: LatLng(_latitude, _longitude),
              onTap: () =>showDialog(
                context: context, 
                builder: (context) => 
                AlertDialog(
                  title: Text(widget.title??""),
                  content: Text(widget.description??""),
                  actions: [
                    TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cerrar")
                    )
                ],
              ),
            )
          )
        },
      ),
      // const String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194';

      floatingActionButton: SolidButton(text: "Abrir en Maps", onPressed: (){Launch.url("https://www.google.com/maps/search/?api=1&query=$_latitude,$_longitude");}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}