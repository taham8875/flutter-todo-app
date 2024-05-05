import 'package:flutter/material.dart';

Future<dynamic> showCreateNewTodoDialog(BuildContext context,
    List<Map<String, dynamic>> todoList, Function setState) {
  return showDialog(
    context: context,
    builder: (context) {
      final TextEditingController controller = TextEditingController();
      return AlertDialog(
        title: const Text('Create a new todo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(label: Text('Enter new task name')),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                todoList.add({
                  'taskName': controller.text,
                  'isCompleted': false,
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      );
    },
  );
}
