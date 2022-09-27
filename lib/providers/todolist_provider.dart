import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:template/models/todo.dart';
import 'package:http/http.dart' as http;

const String apiKey = "6ee09eff-1b5c-4aac-bd7e-0583caa9ab52";

class TodoList with ChangeNotifier {
  late Map<String, Todo> _todoList;
  bool initState = true;

  Map<String, Todo> get todoList => _todoList;

  TodoList() {
    getTodoListFromServer();
  }

  getTodoListFromServer() async {
    _todoList = {};

    Uri api = Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey");
    var serverResponse = await http.get(api);
    var returnData = jsonDecode(serverResponse.body);

    for (var todo in returnData) {
      Todo newTodo = Todo.fromJson(todo);
      _todoList[newTodo.id!] = newTodo;
    }
    initState = false;

    notifyListeners();
  }

  deleteTodo(String id) async {
    Uri api = Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos/$id?key=$apiKey");
    await http.delete(api);
    _todoList.remove(id);

    notifyListeners();
  }

  addTodo(Todo newTodo) async {
    Uri api = Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey");
    String data = jsonEncode(newTodo);
    var serverResponse = await http.post(api, headers: {"Content-Type": "application/json"}, body: data);
    var returnData = jsonDecode(serverResponse.body);

    for (var todo in returnData) {
      Todo newTodo = Todo.fromJson(todo);
      _todoList[newTodo.id!] = newTodo;
    }

    notifyListeners();
  }

  updateChecked(String id) async {
    Uri api = Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos/$id?key=$apiKey");

    _todoList[id]!.done = !_todoList[id]!.done;

    String data = jsonEncode(_todoList[id]);
    await http.put(api, headers: {"Content-Type": "application/json"}, body: data);

    notifyListeners();
  }

  Map<String, Todo> getDoneItems() {
    Map<String, Todo> returnMap = {};

    for (var todo in _todoList.values) {
      if (todo.done) {
        returnMap[todo.id!] = todo;
      }
    }
    return returnMap;
  }

  Map<String, Todo> getUndoneItems() {
    Map<String, Todo> returnMap = {};

    for (var todo in _todoList.values) {
      if (!todo.done) {
        returnMap[todo.id!] = todo;
      }
    }
    return returnMap;
  }
  
}