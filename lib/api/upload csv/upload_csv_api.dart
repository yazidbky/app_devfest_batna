import 'dart:convert'; // Import for JSON decoding
import 'dart:html';
import 'package:app_devfest_batna/api/histogram%20api/histogram_api.dart';
import 'package:http/http.dart' as http;
import 'package:app_devfest_batna/consts/consts.dart';
import 'package:app_devfest_batna/get%20token/get_token.dart';

class FileUploadApiService {
  static const String uploadCsvEndpoint = '/api/upload/upload-csv';

  Future<Map<String, dynamic>> uploadCsvFile({
    required List<int> csvFileBytes,
    required String fileName,
    required File csvFile,
  }) async {
    try {
      final SalesHistogramApiService _apiService = SalesHistogramApiService();

      String? token = await getToken();

      if (token == null) {
        return {
          "success": false,
          "error": "Token not found. Please log in again.",
        };
      }

      final url = Uri.parse('$baseUrl$uploadCsvEndpoint');

      var request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..headers['Content-Type'] = 'multipart/form-data'
        ..files.add(http.MultipartFile.fromBytes(
          'csvFile',
          csvFileBytes,
          filename: fileName,
        ));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('Response Body uplaod : $responseBody');

      if (response.statusCode == 201) {
        final fileId =
            json.decode(responseBody)['fileId']; // Extract fileId from response
        print('File ID: $fileId'); // Log the fileId
        await _apiService.fetchSalesHistogram(fileId: fileId);

        return {
          "success": true,
          "fileId": fileId,
          "message": "CSV file uploaded successfully",
        };
      } else {
        return {
          "success": false,
          "error": "Failed to upload CSV file",
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"success": false, "error": "Failed to connect to the server."};
    }
  }
}
