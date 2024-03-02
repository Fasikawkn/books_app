import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF3F4F6),
        indicatorColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.grey[600]!,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme:
            const AppBarTheme(elevation: 0, backgroundColor: Colors.white),
        useMaterial3: true,
      );
}
