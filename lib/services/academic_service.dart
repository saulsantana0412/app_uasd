import 'dart:convert'; // Para la codificación y decodificación de JSON.
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP.
import 'package:uasd_app/models/subject.dart'; // Modelo de materia.
import 'package:uasd_app/models/task.dart'; // Modelo de tarea.
import 'package:uasd_app/services/token_service.dart'; // Servicio para obtener el token de autenticación.

class AcademicService {

  // Método para obtener la lista de tareas desde la API.
  static Future<List<Task>?> fetchTasks() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/tareas");

    // Obtiene el token de autenticación.
    final token = await TokenService().getValidatedToken();

    if (token == null) return null; // Si no hay token, retorna null.

    try {
      // Realiza la petición GET con el token en el encabezado.
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        // Si la respuesta es exitosa, decodifica el JSON y lo mapea a una lista de tareas.
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((json) => Task.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para obtener la lista de materias disponibles.
  static Future<List<Subject>?> fetchAvaliableSubjects() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/materias_disponibles");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        // Si la respuesta es exitosa, decodifica el JSON y lo mapea a una lista de materias.
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((json) => Subject.fromJson(json)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Método para preseleccionar una materia.
  static Future<bool?> selectSubject(String code) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/preseleccionar_materia");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(code), // Envía el código de la materia.
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          return true; // Si la preselección es exitosa, retorna true.
        } else {
          return false; // Si no, retorna false.
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Método para cancelar la preselección de una materia.
  static Future<bool?> deselectSubject(String code) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/cancelar_preseleccion_materia");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(code), // Envía el código de la materia.
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          return true; // Si la cancelación es exitosa, retorna true.
        } else {
          return false; // Si no, retorna false.
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Método para obtener las materias preseleccionadas.
  static Future<List<Subject>?> fetchSelectedSubjects() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/ver_preseleccion");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

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
        return newsJson.map((json) => Subject.fromJson(json)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
