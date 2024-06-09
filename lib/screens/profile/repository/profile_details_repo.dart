import 'dart:convert';

import '../../../models/sign_up.dart';

import 'package:http/http.dart' as http;

class ProfileDetailsRepository {
  static Future<UserModel?> getUserDetails(String token) async {
    final url = Uri.parse('https://api.escuelajs.co/api/v1/auth/profile');

    try {
      final response =
          await http.get(url, headers: {"Authorization": "Bearer ${token.toString()}"});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return userModelFromJson(response.body);
      } else {
        
        print('Failed to get user: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } on Exception catch (e) {
      print('Error fetching user details: $e');
      return null;
    }
  }
}
