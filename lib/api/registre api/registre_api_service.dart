import 'dart:convert';

import 'package:app_devfest_batna/api/registre%20api/registre_json.dart';
import 'package:app_devfest_batna/consts/consts.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String registreUrl = '$baseUrl/api/auth/register';

  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    // Create User object
    User user = User(name: name, email: email, password: password);

    try {
      // Get the map from User object using toMap
      final Map<String, String> body = user.toMap();

      final response = await http.post(
        Uri.parse(registreUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      // Debugging: Log the response status and body
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        // Parse the response body and return a success message
        final responseBody = json.decode(response.body);
        User registeredUser =
            User.fromJson(responseBody); // Create user from response
        return {
          "success": true,
          "message": "User registered successfully",
          "user": registeredUser
        };
      } else if (response.statusCode == 400) {
        return {"success": false, "error": "Email already in use"};
      } else {
        return {"success": false, "error": "An unexpected error occurred"};
      }
    } catch (e) {
      print("Error: $e"); // Log the error
      return {"success": false, "error": e.toString()};
    }
  }
}
