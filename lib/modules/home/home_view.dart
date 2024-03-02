import 'package:books_app/config/routes.dart';
import 'package:books_app/modules/home/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/api_state.dart';
import '../../widgets/book_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeViewController(),
      builder: (HomeViewController controller) {
        return RefreshIndicator(
          onRefresh: () => controller.getBooks(),
          child: Scaffold(
            appBar: AppBar(
              title: InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.searchView);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      const SizedBox(width: 10),
                      Text(
                        'Search books...',
                        style: Get.textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              centerTitle: true,
            ),
            body: controller.apiState == ApiState.loading
                ? const Center(
                    child: SingleChildScrollView(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : controller.books.isEmpty
                    ? const Center(child: Text('No books found'))
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
                            },
                          );
                        },
                      ),
          ),
        );
      },
    );
  }
}
