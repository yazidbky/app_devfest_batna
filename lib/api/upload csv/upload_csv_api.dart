import 'dart:html';
import 'package:app_devfest_batna/get%20token/get_token.dart';
import 'package:http/http.dart' as http;
import 'package:app_devfest_batna/consts/consts.dart';

class FileUploadApiService {
  static const String uploadCsvEndpoint = '/api/upload/upload-csv';

  Future<Map<String, dynamic>> uploadCsvFile({
    required List<int> csvFileBytes,
    required String fileName,
    required File csvFile,
  }) async {
    try {
      // Retrieve token from SharedPreferences
      String? token = await getToken();

      if (token == null) {
        return {
          "success": false,
          "error": "Token not found. Please log in again.",
        };
      }

      final url = Uri.parse('$baseUrl$uploadCsvEndpoint');

      // Create a multipart request
      var request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token' // Add token to headers
        ..headers['Content-Type'] = 'multipart/form-data'
        ..files.add(http.MultipartFile.fromBytes(
          'csvFile', // The key expected by the server for the file
          csvFileBytes, // Send the byte array directly
          filename: fileName, // Include the filename
        ));

      // Send the request
      final response = await request.send();

      // Process the response
      // final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        // CSV uploaded successfully
        return {
          "success": true,
          "message": "CSV file uploaded successfully",
        };
      } else if (response.statusCode == 400) {
        // No file uploaded
        return {
          "success": false,
          "error": "No file uploaded",
        };
      } else if (response.statusCode == 500) {
        // Server error
        return {
          "success": false,
          "error": "Server error, please try again later.",
        };
      } else {
        // Handle unexpected status codes
        return {
          "success": false,
          "error": "An unexpected error occurred.",
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"success": false, "error": "Failed to connect to the server."};
    }
  }
}
