import 'package:flutter/material.dart';
import 'package:template/models/todo.dart';
import 'package:template/providers/todolist_provider.dart';
import 'package:template/screens/add_listitem_screen.dart';
import 'package:template/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int mode = 0;

  @override
  void initState() {
    super.initState();
    TodoList();
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color.fromARGB(255, 191, 191, 194);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        child: SizedBox(height: 50),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            centerTitle: true,
            title: const Text("TIG169 TODO"),
            actions: [
              PopupMenuButton(
                color: Theme.of(context).scaffoldBackgroundColor,
                icon: const Icon(Icons.more_vert),
                onSelected: (int value) {
                  setState(() {
                    mode = value;
                  });
                },
                itemBuilder: (BuildContext con) {
                  return [
                    const PopupMenuItem(
                        value: 0,
                        child: Text("All", style: TextStyle(color: textColor))),
                    const PopupMenuItem(
                        value: 1,
                        child:
                            Text("Done", style: TextStyle(color: textColor))),
                    const PopupMenuItem(
                        value: 2,
                        child:
                            Text("Undone", style: TextStyle(color: textColor))),
                  ];
                },
              ),
            ],
          ),
        ],
        body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
            child: todoList(mode)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (con) => const AddItemScreen()));
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget todoList(int mode) {
    return Consumer<TodoList>(
      builder: (context, list, child) {
        List<Todo> listToShow = selectionType(mode, list);
        if(list.initState) return const Center(child: CircularProgressIndicator());
        return listToShow.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                    child: Text(
                  getEmptyListString(mode),
                  style: const TextStyle(color: Colors.white),
                )),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...listToShow.map((e) => TodoItem(item: e, key: ValueKey(e.id)))
                ],
              );
      },
    );
  }

  String getEmptyListString(int mode) {
    switch (mode) {
      case 0:
        return "You don't have any todos, add one by tapping on the button at the bottom of the screen";
      case 1:
        return "You don't have any finished todos, check one off!";
      case 2:
        return "All your todos are done!";
      default:
        return "";
    }
  }

  List<Todo> selectionType(int mode, TodoList testList) {
    switch (mode) {
      case 0:
        return testList.todoList;
      case 1:
        return testList.todoList.where((todo) => todo.done).toList();
      case 2:
        return testList.todoList.where((todo) => !todo.done).toList();
      default:
        return [];
    }
  }
}
