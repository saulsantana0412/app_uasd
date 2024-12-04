// services/token_service.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static const _storage = FlutterSecureStorage(); // Instancia de almacenamiento seguro.
  static const _tokenKey = 'auth_token'; // Clave utilizada para almacenar el token.

  // Método para establecer el token
  static Future<void> setToken(String token) async {
    await _storage.write(key: _tokenKey, value: token); // Almacena el token de manera segura.
  }

  // Método privado para obtener el token
  Future<String?> _getToken() async {
    return await _storage.read(key: _tokenKey); // Lee el valor del token almacenado.
  }

  // Método para limpiar el token
  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey); // Elimina el token almacenado.
  }

  // Método para obtener el token con validación
  Future<String?> getValidatedToken() async {
    final token = await _getToken(); // Obtiene el token almacenado.
    if (token == null) {
      return null; // Si el token no existe, retorna null.
    }
    return token; // Si existe, lo retorna.
  }
}
