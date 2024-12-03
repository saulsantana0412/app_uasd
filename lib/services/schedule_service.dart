import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uasd_app/services/token_service.dart';

class ScheduleService {

  static Future<List<dynamic>?> fetchSchedules() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/horarios");

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
          return responseData;
        }
      } catch (e) {
        return null;
      }
    return null;
  }

}