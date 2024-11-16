import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';


class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TaskController taskController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date: ${DateFormat.yMd().format(selectedDate)}'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Select Time: ${selectedTime.format(context)}'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                taskController.addTask(
                  titleController.text,
                  descriptionController.text,
                  selectedDate,
                  selectedTime,
                );
                Get.back();
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
