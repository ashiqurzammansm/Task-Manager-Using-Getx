import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.blueAccent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Use backgroundColor instead of primary
        foregroundColor: Colors.white, // Replaces onPrimary
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent,
    ),
  );
}
