import 'package:flutter/material.dart';
import 'package:uasd_app/utils/app_colors.dart'; // Archivo que define los colores personalizados.
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Librería para reproducir videos de YouTube.

class YouTubePlayer extends StatefulWidget {
  final String videoUrl; // URL del video de YouTube.

  const YouTubePlayer({super.key, required this.videoUrl}); // Constructor que recibe la URL del video.

  @override
  _YouTubePlayerState createState() => _YouTubePlayerState(); // Crea el estado del reproductor.
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late YoutubePlayerController _controller; // Controlador para el reproductor de YouTube.

  @override
  void initState() {
    super.initState();
    // Obtiene el ID del video a partir de la URL proporcionada.
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    // Inicializa el controlador del reproductor con el ID del video.
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false, // El video no comenzará automáticamente.
        mute: true, // El video estará en silencio por defecto.
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera los recursos del controlador cuando el widget se destruye.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retorna el widget del reproductor de YouTube con las configuraciones.
    return YoutubePlayer(
      controller: _controller, // Asocia el controlador con el reproductor.
      showVideoProgressIndicator: true, // Muestra el indicador de progreso del video.
      progressColors: const ProgressBarColors(
        playedColor: AppColors.darkblue, // Color de la barra de progreso para el video reproducido.
      ),
    );
  }
}
