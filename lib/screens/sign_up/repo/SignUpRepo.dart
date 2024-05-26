import 'package:http/http.dart' as http;
import 'package:shop_app/models/sign_up.dart';

class Signuprepo {
  static Future<UserModel?> signUpUser(String name, String email, String password) async {
    final url = Uri.parse('https://fakestoreapi.com/users');

    final userModel = UserModel(
        email: email,
        username: name,
        password: password,
        name: Name(firstname: name, lastname: name));

    final response =
        await http.post(url, body: userModelToJson(userModel), headers: {
      'Content-Type': 'application/json',
    });

    if(response.statusCode == 201 || response.statusCode == 200){
      return userModelFromJson(response.body);
    }
    else{
      return null;
    }
  }
}
