import 'dart:convert';
import 'package:app_devfest_batna/api/login%20api/login_json.dart';
import 'package:app_devfest_batna/consts/consts.dart';
import 'package:http/http.dart' as http;

class LoginApiService {
  static const String loginEndpoint = '/api/auth/login';

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$loginEndpoint');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        LoginJson loggedInUser = LoginJson.fromJson(responseBody);
        return {
          "success": true,
          "message": "User logged in successfully",
          "user": loggedInUser,
        };
      } else if (response.statusCode == 401) {
        return {
          "success": false,
          "error": "Invalid credentials",
        };
      } else {
        return {
          "success": false,
          "error": "An unexpected error occurred, please try again later.",
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"success": false, "error": "Failed to connect to the server."};
    }
  }
}
