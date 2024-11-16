import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
