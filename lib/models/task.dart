import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  DateTime date;
  TimeOfDay time;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.isCompleted = false,
  });
}
