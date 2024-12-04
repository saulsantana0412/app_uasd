import 'dart:convert'; // Para la codificación y decodificación de JSON.
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP.
import 'package:uasd_app/models/debt.dart'; // Modelo de deuda.
import 'package:uasd_app/services/token_service.dart'; // Servicio para obtener el token de autenticación.

class DebtService {

  // Método para obtener las deudas (fetchDebts).
  static Future<List<Debt>?> fetchDebts() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/deudas");

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
        
        // Retorna una lista de objetos 'Debt' a partir de los datos obtenidos.
        return responseData.map((json) => Debt.fromJson(json)).toList();
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }
}
