import 'package:flutter/material.dart';
import 'package:template/models/todo.dart';

class TodoList with ChangeNotifier {

    final Map<int, Todo> _testList = {
      1 : Todo(id: 1, checked: false, title: "Do something"),
      2 : Todo(id: 2, checked: true, title: "Do something else"),
      3 : Todo(id: 3, checked: false, title: "Do something else 2"),
      4 : Todo(id: 4, checked: false, title: "Do something else 3"),
      5 : Todo(id: 5, checked: true, title: "Do something else 4"),
      6 : Todo(id: 6, checked: false, title: "Do something else 5"),
      7 : Todo(id: 7, checked: false, title: "Do something else 6"),
      8 : Todo(id: 8, checked: false, title: "Do something else 7"),
      9 : Todo(id: 9, checked: false, title: "Do something else 8"),
      10 : Todo(id: 10, checked: false, title: "Do something else 9"),
      11 : Todo(id: 11, checked: false, title: "Do something else 10"),
      12 : Todo(id: 12, checked: false, title: "Do something else 11"),
      13 : Todo(id: 13, checked: false, title: "Do something else 12"),
      14 : Todo(id: 14, checked: false, title: "Do something else 13"),
    };

    Map<int, Todo> get testList => _testList;

    deleteTodo (int id) {
      _testList.remove(id);
      notifyListeners();
    }

    addTodo (Todo newTodo) {
      _testList[newTodo.id] = newTodo;
      notifyListeners();
    }

    updateChecked (int id) {
      _testList[id]!.checked = !_testList[id]!.checked;
      notifyListeners();
    }

    Map<int, Todo> getDoneItems() {
      Map<int, Todo> returnMap = {};

      for(var todo in testList.values) {
        if(todo.checked) {
          returnMap[todo.id] = todo;
        }
      }
      return returnMap;
    }

    Map<int, Todo> getUndoneItems() {
      Map<int, Todo> returnMap = {};

      for(var todo in testList.values) {
        if(!todo.checked) {
          returnMap[todo.id] = todo;
        }
      }
      return returnMap;
    }

}