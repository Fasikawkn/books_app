import 'package:books_app/data/api_provider.dart';

import '../models/book.dart';

class BookRepository {
  final ApiProvider apiProvider;
  BookRepository() : apiProvider = ApiProvider();

  Future<List<Book>> getBooks() async {
    final response = await apiProvider.getBooks();
    return response.map((json) => Book.fromHomeJson(json['work'])).toList();
  }

  Future<List<Book>> searchBooks(String query) async {
    final response = await apiProvider.searchBooks(query);
    return response.map((json) => Book.fromSearchJson(json)).toList();
  }
}
