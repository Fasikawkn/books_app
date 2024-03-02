import 'package:books_app/config/pages.dart';
import 'package:books_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Books App',
      theme: AppTheme.theme,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
