import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/video_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/models/video.dart';
import 'package:uasd_app/services/content_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

// Pantalla que muestra una lista de videos obtenidos desde un servicio API.
class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {

  // Lista para almacenar los videos obtenidos de la API
  List<Video> _videos = [];
  
  // Bandera para mostrar el estado de carga
  bool loading = true;

  // Método para obtener los videos desde el servicio ContentService
  Future <void> fetchVideos() async{
    // Llamada al servicio para obtener los videos
    final data = await ContentService.fetchVideos();

    // Si los datos son válidos y la pantalla aún está activa, actualizamos el estado
    if(data != null && mounted){
      _videos = data; // Asignamos los videos obtenidos a la lista
      setState(() {
        loading = false; // Cambiamos la bandera de carga a falso
      });
    }
  }

  // Método que se llama al inicializar el estado de la pantalla
  @override
  void initState() {
    super.initState();
    fetchVideos(); // Cargamos los videos cuando la pantalla se inicializa
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tema de texto para usar en los widgets
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor, // Fondo de la pantalla
      ),
      padding: const EdgeInsets.all(20), // Espaciado del contenedor
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alineación de los elementos
        children: [
          Text("Videos publicados", style: textTheme.titleMedium), // Título
          
          // Si los videos aún están cargando, mostramos un indicador de progreso
          if(loading) const CustomCircularProgress(),
          
          // Si no hay videos y no están cargando, mostramos un mensaje
          if (!loading && _videos.isEmpty)
            Text("Aún no hay videos publicados", style: Theme.of(context).textTheme.bodyMedium),
          
          // Si se han cargado los videos, los mostramos en una lista
          if (!loading && _videos.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _videos.length, // Número de videos a mostrar
                itemBuilder: (context, index) {
                  // Para cada video, mostramos un VideoCard
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoCard(video: _videos[index]), // Tarjeta para mostrar el video
                      const SizedBox(height: 20), // Espaciado entre los videos
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
