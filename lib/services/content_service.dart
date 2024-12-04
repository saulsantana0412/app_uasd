import 'dart:convert'; // Para la codificación y decodificación de JSON.
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP.
import 'package:uasd_app/models/event.dart'; // Modelo de evento.
import 'package:uasd_app/models/new.dart'; // Modelo de noticia.
import 'package:uasd_app/models/video.dart'; // Modelo de video.
import 'package:uasd_app/services/token_service.dart'; // Servicio para obtener el token de autenticación.

class ContentService {

  // Método para obtener las noticias (fetchNews).
  static Future<List<New>?> fetchNews() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/noticias");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.
    
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> newsJson = responseData['data'];
        
        // Retorna una lista de objetos 'New' a partir de los datos obtenidos.
        return newsJson.map((json) => New.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para obtener los eventos (fetchEvents).
  static Future<List<Event>?> fetchEvents() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/eventos");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.
    
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        
        // Retorna una lista de objetos 'Event' a partir de los datos obtenidos.
        return responseData.map((json) => Event.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para obtener los videos (fetchVideos).
  static Future<List<Video>?> fetchVideos() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/videos");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.
    
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        
        // Retorna una lista de objetos 'Video' a partir de los datos obtenidos.
        return responseData.map((json) => Video.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }
}
