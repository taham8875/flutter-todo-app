import 'package:flutter/material.dart';
import 'package:flutter_todo_app/util/dialog_box.dart';
import 'package:flutter_todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // dummy todo list
  final List<Map<String, dynamic>> todoList = [
    {
      'taskName': 'Buy milk',
      'isCompleted': false,
    },
    {
      'taskName': 'Go to gym',
      'isCompleted': true,
    },
    {
      'taskName': 'Do homework',
      'isCompleted': false,
    },
  ];

  dynamic toggleIsCompleted(bool? value, int index) {
    setState(() {
      todoList[index]['isCompleted'] = value;
    });
  }

  void createTodo() {
    showCreateNewTodoDialog(
      context,
      todoList,
      setState,
    );
  }

  void deleteTodo(int index) {
    // show confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete todo'),
          content: const Text('Are you sure you want to delete this todo?'),
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
                  todoList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo App')),
        floatingActionButton: FloatingActionButton(
          onPressed: createTodo,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.blue.shade100,
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return TodoTile(
              taskName: todo['taskName'],
              isCompleted: todo['isCompleted'],
              onChanged: (value) {
                toggleIsCompleted(value, index);
              },
              deleteTodo: (context) {
                deleteTodo(index);
              },
            );
          },
        ));
  }
}
