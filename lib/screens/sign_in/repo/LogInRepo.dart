import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/sign_up.dart';

class LogInRepo {


  static Future<String?> LogIn(String email, String password) async {

    final url = Uri.parse('https://api.escuelajs.co/api/v1/auth/login');
    final response = await http.post(url,body: jsonEncode({
      "email" : email,
      "password" : password
    }));


    if(response.statusCode == 201 || response.statusCode == 200){
      var data = json.decode(response.body);
      return data['access_token'];
    }
    else{
      print('Failed to log in: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }

  }
  
  static Future<UserModel?> getCurrentUser(String token) async {
    final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
    headers:{
      'Authorization' : 'Bearer $token'
    });

    if(response.statusCode == 200){
      return userModelFromJson(response.body);
    }
    else{
      print('Failed to fetch user: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
  
  
 
}