import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_icon_button_small.dart';
import 'package:uasd_app/models/video.dart';
import 'package:uasd_app/utils/app_colors.dart';
import 'package:uasd_app/utils/methods/youtube_player.dart';

/// Widget que muestra una tarjeta con los detalles de un video.
class VideoCard extends StatelessWidget {
  final Video video; // El video que se mostrará en la tarjeta.

  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = Theme.of(context).textTheme; 
    
    // Construye la URL del video de YouTube usando el ID proporcionado.
    String videourl = "https://www.youtube.com/watch?v=${video.url}";

    return Container(
      width: double.infinity, // La tarjeta ocupa el ancho completo disponible.
      decoration: BoxDecoration(
        color: AppColors.white, 
        borderRadius: const BorderRadius.all(Radius.circular(10)), 
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGray.withOpacity(.05), 
            blurRadius: 10
        )],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alineación del contenido a la izquierda.
        children: [
          Padding(
            padding: const EdgeInsets.all(10), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alineación del texto a la izquierda.
              children: [
                Text(video.titulo, style: textTheme.labelLarge), // Muestra el título del video.
                const SizedBox(height: 5),
                Text(video.fechaPublicacion.toString().split(".")[0], style: textTheme.bodySmall), // Muestra la fecha de publicación del video.
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10), // Bordes redondeados en la parte inferior de la tarjeta.
              bottomRight: Radius.circular(10),
            ),
            child: Stack(
              children: [
                YouTubePlayer(videoUrl: videourl), // Reproductor de YouTube para mostrar el video.
                CustomIconButtonSmall(url: videourl), // Icono para acceder al video en YouTube.
              ],
            ),
          ),
        ],
      ),
    );
  }
}