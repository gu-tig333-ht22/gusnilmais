import 'package:flutter/material.dart';
import 'package:template/screens/add_listitem_screen.dart';
import 'package:template/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const Color textColor = Color.fromARGB(255, 191, 191, 194);

    List<TodoItem> testList = [
      const TodoItem(checked: false, title: "Do something"),
      const TodoItem(checked: true, title: "Do something else"),
      const TodoItem(checked: false, title: "Do something else 2"),
      const TodoItem(checked: false, title: "Do something else 3"),
      const TodoItem(checked: true, title: "Do something else 4"),
      const TodoItem(checked: false, title: "Do something else 5"),
      const TodoItem(checked: false, title: "Do something else 6"),
      const TodoItem(checked: false, title: "Do something else 7"),
      const TodoItem(checked: false, title: "Do something else 8"),
      const TodoItem(checked: false, title: "Do something else 9"),
      const TodoItem(checked: false, title: "Do something else 10"),
      const TodoItem(checked: false, title: "Do something else 11"),
      const TodoItem(checked: false, title: "Do something else 12"),
      const TodoItem(checked: false, title: "Do something else 13"),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        child: SizedBox(height: 45),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text("TIG169 TODO"),
        actions: [ PopupMenuButton(
                color: Theme.of(context).scaffoldBackgroundColor,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext con) {
                  return  [
                    const PopupMenuItem(value: 0, child: Text("All", style: TextStyle(color: textColor))),
                    const PopupMenuItem(value: 1, child: Text("Done", style: TextStyle(color: textColor))),
                    const PopupMenuItem(value: 2, child: Text("Undone", style: TextStyle(color: textColor))),
                  ];
                },
              ),],
      ),],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [...testList],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (con) => const AddItemScreen()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
