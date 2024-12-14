import 'dart:convert';
import 'package:app_devfest_batna/consts/consts.dart';
import 'package:http/http.dart' as http;

class SalesHistogramApiService {
  static const String salesHistogramEndpoint = '/api/histograms/sales';

  Future<Map<String, dynamic>> fetchSalesHistogram({
    required String fileId,
  }) async {
    String file = '675c8b40f94c5b4499876bd6';
    try {
      final url = Uri.parse('$baseUrl$salesHistogramEndpoint/$file');

      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body histo1  : ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        return {
          "success": true,
          "message": responseBody['message'],
          "data": responseBody['data'],
        };
      } else if (response.statusCode == 400) {
        return {
          "success": false,
          "error": "fileId is required or invalid", // Updated error message
        };
      } else if (response.statusCode == 504) {
        return {
          "success": false,
          "error": "No response from external service",
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
