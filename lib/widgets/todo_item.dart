import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;
  final bool checked;
  const TodoItem({required this.checked, required this.title, Key? key})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
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
                  value: widget.checked,
                  onChanged: (_) {}),
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: const Color.fromARGB(255, 191, 191, 194),
                  decoration: widget.checked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close,
                    color: Color.fromARGB(255, 120, 120, 121)))
          ],
        ),
      ),
    );
  }
}
