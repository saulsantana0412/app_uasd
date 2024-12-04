import 'dart:convert'; // Para la codificación y decodificación de JSON.
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP.
import 'package:uasd_app/models/request.dart'; // Modelo de solicitud.
import 'package:uasd_app/models/request_type.dart'; // Modelo de tipo de solicitud.
import 'package:uasd_app/services/token_service.dart'; // Servicio para obtener el token de autenticación.

class RequestService {

  // Método para obtener las solicitudes del usuario (fetchRequests).
  static Future<List<Request>?> fetchRequests() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/mis_solicitudes");

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
        final List<dynamic> requestsJson = responseData['data'];
        
        // Retorna una lista de objetos 'Request' a partir de los datos obtenidos.
        return requestsJson.map((json) => Request.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para obtener los tipos de solicitud (fetchRequestTypes).
  static Future<List<RequestType>?> fetchRequestTypes() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/tipos_solicitudes");

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
        final List<dynamic> requestTypesJson = responseData['data'];
        
        // Retorna una lista de objetos 'RequestType' a partir de los datos obtenidos.
        return requestTypesJson.map((json) => RequestType.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para crear una nueva solicitud (createRequest).
  static Future<bool?> createRequest(String type, String description) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/crear_solicitud");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.

    final body = {
      "tipo": type,
      "descripcion": description,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Si la respuesta es exitosa, retorna true, de lo contrario false.
        if (responseData['success'] == true) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para cancelar una solicitud existente (cancelRequest).
  static Future<bool?> cancelRequest(int id) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/cancelar_solicitud");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(id),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Si la respuesta es exitosa, retorna true, de lo contrario false.
        if (responseData['success'] == true) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }
}
