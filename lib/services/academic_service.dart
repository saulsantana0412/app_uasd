import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uasd_app/models/subject.dart';
import 'package:uasd_app/models/task.dart';
import 'package:uasd_app/services/token_service.dart';

class AcademicService {

  static Future<List<Task>?> fetchTasks() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/tareas");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;
    
    try{
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        });

        if (response.statusCode == 200){

          final List<dynamic> responseData = jsonDecode(response.body);
          return responseData.map((json) => Task.fromJson(json)).toList();
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
    return null;
  }

  static Future<List<Subject>?> fetchAvaliableSubjects() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/materias_disponibles");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;
    
    try{
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        });

        if (response.statusCode == 200){

          final List<dynamic> responseData = jsonDecode(response.body);
          return responseData.map((json) => Subject.fromJson(json)).toList();
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
    return null;
  }

  static Future<bool?> selectSubject(String code) async{
    final url = Uri.parse("https://uasdapi.ia3x.com/preseleccionar_materia");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    try{
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(code),
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

  static Future<bool?> deselectSubject(String code) async{
    final url = Uri.parse("https://uasdapi.ia3x.com/cancelar_preseleccion_materia");

    final token = await TokenService().getValidatedToken();

    if (token == null) return null;

    try{
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(code),
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

  static Future<List<Subject>?> fetchSelectedSubjects() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/ver_preseleccion");

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
          return newsJson.map((json) => Subject.fromJson(json)).toList();
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
    return null;
  }

}