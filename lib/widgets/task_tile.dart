import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onMarkComplete;

  TaskTile({
    required this.task,
    required this.onDelete,
    required this.onMarkComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (bool? value) {
            onMarkComplete();
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.description),
            SizedBox(height: 5),
            Text(
              'Date: ${task.date.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              'Time: ${task.time.format(context)}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
