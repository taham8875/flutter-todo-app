import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged,
      required this.deleteTodo});

  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteTodo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTodo,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Checkbox(value: isCompleted, onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            onChanged!(!isCompleted);
          },
        ),
      ),
    );
  }
}
