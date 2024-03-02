import 'dart:convert';

import 'package:books_app/config/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final http.Client apiClient = http.Client();

  Future<List<dynamic>> getBooks() async {
    final response = await apiClient.get(Uri.parse(Constants.bookUrl));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['reading_log_entries'] as List);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<dynamic>> searchBooks(String query) async {
    final response = await apiClient.get(
      Uri.parse('${Constants.searchUrl}?title=${query.isEmpty ? '\'\'' : query}'),
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['docs'] as List);
    } else {
      throw Exception('Failed to load books');
    }
  }
}
