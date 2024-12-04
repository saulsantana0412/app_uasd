import 'package:url_launcher/url_launcher.dart'; // Importa la librería para lanzar URLs.

class Launch {

  // Método estático para lanzar una URL.
  static Future<void> url(String url) async {
    final Uri uri = Uri.parse(url); // Convierte la URL recibida en un objeto Uri.

    // Intenta lanzar la URL y verifica si fue exitoso.
    if (!await launchUrl(uri)) {
      // Si no se pudo lanzar la URL, lanza una excepción.
      throw Exception('No se pudo lanzar $uri');
    }
  }
}
