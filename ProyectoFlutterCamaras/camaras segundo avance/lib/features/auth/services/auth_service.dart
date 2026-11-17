import 'dart:convert';

import 'package:camaras/core/constants/api_constants.dart';
import 'package:camaras/core/storage/local_storage_service.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final LocalStorageService _storageService = LocalStorageService();

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final token = data['accessToken'] as String?;

        if (token == null) return false;

        await _storageService.saveToken(token);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}