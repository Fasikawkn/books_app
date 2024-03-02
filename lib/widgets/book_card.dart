import 'package:books_app/config/constants.dart';
import 'package:books_app/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
    required this.onButtonClicked,
  });
  final Book book;
  final Function() onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                '${Constants.bookImageUrl}/${book.coverId}-M.jpg',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  height: 80,
                  child: Icon(
                    Icons.image,
                    size: 40,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            book.title!,
                            style: Get.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      book.isRead ? buildReadButton() : buildUnreadButton(),
                    ],
                  ),
                  Text(
                    'Published in ${book.firstPublishYear}',
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person,
                            size: 20, color: Get.theme.colorScheme.secondary),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            book.authors,
                            style:
                                Get.textTheme.bodyLarge?.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReadButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        elevation: 0.0,
        backgroundColor: Get.theme.indicatorColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: onButtonClicked,
      child: Text(
        'Read',
        style: Get.textTheme.bodySmall?.copyWith(
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget buildUnreadButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: onButtonClicked,
      child: Text(
        'Unread',
        style: Get.textTheme.bodySmall,
      ),
    );
  }
}
