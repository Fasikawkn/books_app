import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../data/repository.dart';
import '../../models/api_state.dart';
import '../../models/book.dart';

class SearchViewController extends GetxController {
  late BookRepository bookRepository;

  List<Book> books = <Book>[];
  ApiState apiState = ApiState.initial;

  final debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  @override
  void onInit() {
    bookRepository = BookRepository();
    super.onInit();
  }

  Future<void> searchBooks(
    String query,
  ) async {
    try {
      apiState = ApiState.loading;
      books = <Book>[];
      update();
      books = await bookRepository.searchBooks(query);
      apiState = ApiState.success;
      update();
    } catch (e) {
      apiState = ApiState.error;
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: 'Failed to load books',
        duration: Duration(seconds: 3),
      ));
    } finally {
      update();
    }
  }
}
