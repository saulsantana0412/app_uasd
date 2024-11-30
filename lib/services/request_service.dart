
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uasd_app/models/request.dart';
import 'package:uasd_app/models/request_type.dart';
import 'package:uasd_app/services/token_service.dart';

class RequestService {

  static Future<List<Request>?> fetchRequests() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/mis_solicitudes");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;
    
    try{
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        });

      if (response.statusCode == 200){
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> newsJson = responseData['data'];
        return newsJson.map((json) => Request.fromJson(json)).toList();
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
    return null;
  }

  static Future<List<RequestType>?> fetchRequestTypes() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/tipos_solicitudes");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;
    
    try{
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        });

        if (response.statusCode == 200){
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final List<dynamic> newsJson = responseData['data'];
          return newsJson.map((json) => RequestType.fromJson(json)).toList();
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
    return null;
  }

  static Future<bool?> createRequest(String type, String description) async{
    final url = Uri.parse("https://uasdapi.ia3x.com/crear_solicitud");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    final body = {
      "tipo": type,
      "descripcion": description,
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
      print('Excepción: $e');
      return null;
    }

    return null;
  }


  static Future<bool?> cancelRequest(int id) async{
    final url = Uri.parse("https://uasdapi.ia3x.com/cancelar_solicitud");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    try{
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(id),
        );

        if (response.statusCode == 200){

          final responseData = jsonDecode(response.body);

          if (responseData['success'] == true){
            print(responseData["message"]);
            return true;
          } else {
            return false;
        }
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }

    return null;
  }

}