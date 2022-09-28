import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/todo.dart';
import 'package:template/providers/todolist_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo item;

  const TodoItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 55, 56, 63),
              Color.fromARGB(255, 71, 72, 75),
              Color.fromARGB(255, 55, 56, 63),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: const Color.fromARGB(255, 120, 120, 121),
              ),
              child: Checkbox(
                activeColor: Theme.of(context).primaryColor,
                value: item.done,
                onChanged: (_) {
                  Provider.of<TodoList>(context, listen: false)
                      .updateChecked(item);
                },
              ),
            ),
            Text(
              item.title,
              style: TextStyle(
                  color: const Color.fromARGB(255, 191, 191, 194),
                  decoration: item.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Provider.of<TodoList>(context, listen: false).deleteTodo(item);
              },
              icon: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 120, 120, 121),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
