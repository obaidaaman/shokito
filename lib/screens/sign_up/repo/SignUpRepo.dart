import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/sign_up.dart';

class Signuprepo {
  static Future<UserModel?> signUpUser(
      String name, String email, String password) async {
    final url = Uri.parse('https://api.escuelajs.co/api/v1/users/');

    final userModel = UserModel(
        email: email,
        password: password,
        name: name,
        role: 'customer',
        avatar:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fperson%2F&psig=AOvVaw0lMnWofdehezoNOjwuk3sW&ust=1716889832031000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCICRmpbHrYYDFQAAAAAdAAAAABAE');

    final response = await http.post(
        headers: {"Content-Type": "application/json"},
        url,
        body: userModelToJson(userModel));
    if (response.statusCode == 201) {
      print(response.body);
      return userModelFromJson(response.body);
    } else {
      throw Exception(
          'Failed to create user: ${response.statusCode}, ${response.body}');
    }
  }
}
