import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uasd_app/models/event.dart';
import 'package:uasd_app/models/new.dart';
import 'package:uasd_app/models/video.dart';
import 'package:uasd_app/services/token_service.dart';

class ContentService {

  static Future<List<New>?> fetchNews() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/noticias");

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
          return newsJson.map((json) => New.fromJson(json)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<List<Event>?> fetchEvents() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/eventos");

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
          return responseData.map((json) => Event.fromJson(json)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<List<Video>?> fetchVideos() async{
    final url = Uri.parse("https://uasdapi.ia3x.com/videos");

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
          return responseData.map((json) => Video.fromJson(json)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

}