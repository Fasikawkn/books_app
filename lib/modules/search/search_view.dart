import 'package:books_app/modules/search/search_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/api_state.dart';
import '../../widgets/book_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewController>(
        init: SearchViewController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.theme.colorScheme.secondary,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: TextFormField(
                    onChanged: (value) {
                      controller.debouncer.call(() {
                        controller.searchBooks(value);
                      });
                    },
                    style: Get.theme.textTheme.bodyLarge,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search books...',
                      border: InputBorder.none,
                      hintStyle: Get.textTheme.bodySmall!,
                    ),
                  ))
                ],
              ),
            )),
            body: controller.apiState == ApiState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.books.isEmpty
                    ? Center(
                        child: Text(
                          controller.apiState == ApiState.initial
                              ? 'Search for books'
                              : 'No books found',
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.books.length,
                        padding: const EdgeInsets.all(15),
                        itemBuilder: (BuildContext context, int index) {
                          return BookCard(
                              book: controller.books[index],
                              onButtonClicked: () {
                                controller.books[index].isRead =
                                    !controller.books[index].isRead;
                                controller.update();
                              });
                        },
                      ),
          );
        });
  }
}
