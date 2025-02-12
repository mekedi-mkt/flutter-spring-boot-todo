import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.green,
          ),
        ),
        TextField(
          autofocus: true,
          onChanged: (val) {
            taskTitle = val;
          },
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            if (taskTitle.isNotEmpty) {
              Provider.of<TasksProvider>(context, listen: false)
                  .addTask(taskTitle);
              Navigator.pop(context);
            }
          },
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.green),
        ),
      ],
    );
  }
}
