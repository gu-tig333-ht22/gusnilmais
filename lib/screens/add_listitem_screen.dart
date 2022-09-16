import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/todo.dart';
import 'package:template/providers/todolist_provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController inputController = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("TIG169 TODO"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 40, 25, 40),
            child: Card(
              color: const Color.fromARGB(255, 55, 56, 63),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (_) => setState(() {}),
                  cursorColor: Theme.of(context).primaryColor,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 191, 191, 194)),
                  controller: inputController,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
                      errorText: errorText,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 191, 191, 194)),
                      hintText: "What are you going to do?"),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: inputController.text.isEmpty
                ? () => setState(() {
                      errorText = "You need to write a todo";
                    })
                : () {
                    Provider.of<TodoList>(context, listen: false).addTodo(Todo(
                        id: DateTime.now().millisecondsSinceEpoch,
                        checked: false,
                        title: inputController.text));
                    Navigator.of(context).pop();
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add, color: Color.fromARGB(255, 191, 191, 194)),
                SizedBox(width: 5),
                Text(
                  "ADD",
                  style: TextStyle(
                      color: Color.fromARGB(255, 191, 191, 194),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}
