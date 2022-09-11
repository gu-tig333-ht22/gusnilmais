import 'package:flutter/material.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

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
                  cursorColor: Theme.of(context).primaryColor,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 191, 191, 194)),
                  controller: inputController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 191, 191, 194)),
                      hintText: "What are you going to do?"),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
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
}
