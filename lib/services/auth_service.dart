import 'dart:convert'; // Para la codificación y decodificación de JSON.
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP.
import 'package:uasd_app/models/user.dart'; // Modelo de usuario.
import 'package:uasd_app/services/token_service.dart'; // Servicio para obtener el token de autenticación.

class AuthService {

  // Método para iniciar sesión (login).
  static Future<User?> login(String username, String password) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/login");

    final body = {
      "username": username,
      "password": password
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Si la respuesta es exitosa y contiene los datos del usuario, lo retorna.
        if (responseData['success'] == true) {
          return User.fromJson(responseData['data']);
        } else {
          return null; // Si el inicio de sesión falla, retorna null.
        }
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para obtener la información del usuario logueado.
  static Future<User?> userInfo() async {
    final url = Uri.parse("https://uasdapi.ia3x.com/info_usuario");
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
        final responseData = jsonDecode(response.body);

        // Si la respuesta es exitosa y contiene los datos del usuario, lo retorna.
        if (responseData['success'] == true) {
          return User.fromJson(responseData['data']);
        } else {
          return null;
        }
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para cambiar la contraseña del usuario.
  static Future<bool?> changePassword(String oldPassword, String newPassword) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/cambiar_password");
    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    final body = {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "confirmPassword": newPassword 
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

        // Si el cambio de contraseña es exitoso, retorna true.
        if (responseData['success'] == true) {
          return true;
        } else {
          return false; // Si no, retorna false.
        }
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }

  // Método para restablecer la contraseña del usuario.
  static Future<bool?> resetPassword(String username, String email) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/reset_password");

    final body = {
      "usuario": username,
      "email": email,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Si el restablecimiento de contraseña es exitoso, retorna true.
        if (responseData['success'] == true) {
          return true;
        } else {
          return false; // Si no, retorna false.
        }
      }
    } catch (e) {
      return null; // Si ocurre un error, retorna null.
    }
    return null;
  }
}
