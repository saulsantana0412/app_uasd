import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uasd_app/models/user.dart';
import 'package:uasd_app/services/token_service.dart';

class AuthService {

  static Future<User?> login(String username, String password) async {
    final url = Uri.parse("https://uasdapi.ia3x.com/login");

    final body = {
    "username": username,
    "password": password
    };

    try{
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
        );

        if (response.statusCode == 200){

          final responseData = jsonDecode(response.body);

          if (responseData['success'] == true){
            return User.fromJson(responseData['data']);
          } else {
            return null;
        }
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  static Future<User?> userInfo() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/info_usuario");
    final token = await TokenService().getValidatedToken();

    if (token == null) return null;
    try{
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        });

        if (response.statusCode == 200){

          final responseData = jsonDecode(response.body);

          if (responseData['success'] == true){
            return User.fromJson(responseData['data']);
          } else {
            return null;
        }
      }else{
      }
    } catch (e) {
      return null;
    }

    return null;
  }


  static Future<bool?> changePassword(String oldPassword, String newPassword) async{
    final url = Uri.parse("https://uasdapi.ia3x.com/cambiar_password");
    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    final body = {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "confirmPassword": newPassword 
    };

    try{
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
        );

        if (response.statusCode == 200){

          final responseData = jsonDecode(response.body);
          if (responseData['success'] == true){
            return true;
          } else {
            return false;
        }
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  static Future<bool?> resetPassword(String username, String email) async{
    final url = Uri.parse("https://uasdapi.ia3x.com/reset_password");

    final body = {
      "usuario": username,
      "email": email,
    };

    try{
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
        );

        if (response.statusCode == 200){

          final responseData = jsonDecode(response.body);

          if (responseData['success'] == true){
            return true;
          } else {
            return false;
        }
      }
    } catch (e) {
      return null;
    }

    return null;
  }

}