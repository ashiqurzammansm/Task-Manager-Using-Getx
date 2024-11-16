import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(String title, String description, DateTime date, TimeOfDay time) {
    tasks.add(Task(title: title, description: description, date: date, time: time));
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void toggleTaskStatus(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }
}
