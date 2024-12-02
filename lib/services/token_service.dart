// services/token_service.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static const _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  // Método para establecer el token
  static Future<void> setToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // Método para obtener el token
  Future<String?> _getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // Método para limpiar el token
  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // Método para obtener el token con validación
  Future<String?> getValidatedToken() async {
    final token = await _getToken();
    if (token == null) {
      // Avisar que no hay token disponible
      print('No hay token disponible');
      return null;
    }
    return token;
  }
}
