import 'package:books_app/data/repository.dart';
import 'package:books_app/models/api_state.dart';
import 'package:get/get.dart';

import '../../models/book.dart';

class HomeViewController extends GetxController {
  late BookRepository bookRepository;

  List<Book> books = <Book>[];
  ApiState apiState = ApiState.initial;

  @override
  void onInit() {
    super.onInit();
    bookRepository = BookRepository();
    getBooks();
  }

  Future<void> getBooks() async {
    try {
      apiState = ApiState.loading;
      update();
      books = await bookRepository.getBooks();
      apiState = ApiState.success;
      update();
    } catch (e) {
      apiState = ApiState.error;
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: 'Failed to load books',
        duration: Duration(seconds: 3),
      ));
      update();
    } 
  }
}
