import 'package:shop_app/screens/profile/model/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileDetailsRepository {
  static Future<ProfileModel?> getUserDetails() async {
    final url = Uri.parse('https://fakestoreapi.com/users/1');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return profileModelFromJson(response.body);
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
