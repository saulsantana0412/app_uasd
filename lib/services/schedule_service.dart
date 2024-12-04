import 'dart:convert'; // Para la codificación y decodificación de JSON.
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP.
import 'package:uasd_app/services/token_service.dart'; // Servicio para obtener el token de autenticación.

class ScheduleService {

  // Método para obtener los horarios (fetchSchedules).
  static Future<List<dynamic>?> fetchSchedules() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/horarios");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.
    
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token", // Incluye el token en la cabecera de la solicitud.
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body); // Decodifica la respuesta JSON.
        return responseData; // Retorna la lista de horarios obtenidos.
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null; // Si la respuesta no es válida, retorna null.
  }

}
