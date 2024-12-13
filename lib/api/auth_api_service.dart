import 'dart:convert';
import 'package:app_devfest_batna/consts/consts.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String registreUrl = '$baseUrl/api/auth/registre';

  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Prepare the request body
      final Map<String, String> body = {
        "name": name,
        "email": email,
        "password": password,
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(registreUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      // Handle the response based on status code
      if (response.statusCode == 201) {
        return {"success": true, "message": "User registered successfully"};
      } else if (response.statusCode == 400) {
        return {"success": false, "error": "Email already in use"};
      } else {
        return {"success": false, "error": "An unexpected error occurred"};
      }
    } catch (error) {
      return {"success": false, "error": error.toString()};
    }
  }
}
