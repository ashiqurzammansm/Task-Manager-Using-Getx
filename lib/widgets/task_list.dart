import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return taskController.tasks.isEmpty
          ? Center(child: Text('No tasks added yet!'))
          : ListView.builder(
        itemCount: taskController.tasks.length,
        itemBuilder: (context, index) {
          final task = taskController.tasks[index];
          return TaskTile(
            task: task,
            onDelete: () => taskController.removeTask(index),
            onMarkComplete: () {
              taskController.toggleTaskStatus(index);
            },
          );
        },
      );
    });
  }
}
