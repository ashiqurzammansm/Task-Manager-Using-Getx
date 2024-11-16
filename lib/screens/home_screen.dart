import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Corrected import
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat.yMMMMd().format(DateTime.now());
    String currentTime = TimeOfDay.now().format(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add a settings screen later if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Today: $currentDate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Current Time: $currentTime',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Expanded(child: TaskList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
