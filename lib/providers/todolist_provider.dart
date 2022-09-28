import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:template/models/todo.dart';
import 'package:http/http.dart' as http;

const String apiKey = "6ee09eff-1b5c-4aac-bd7e-0583caa9ab52";
const String baseUrl = "https://todoapp-api.apps.k8s.gu.se/todos";
const String key = "?key=$apiKey";

class TodoList with ChangeNotifier {
  List<Todo> _todoList = [];
  bool initState = true;

  List<Todo> get todoList => _todoList;

  TodoList() {
    getTodoListFromServer();
  }

  getTodoListFromServer() async {
    http.Response serverResponse = await http.get(Uri.parse(baseUrl + key));

    if (serverResponse.statusCode == 200) {
      updateTodoList(serverResponse);
      initState = false;
    } else {
      throw Exception("Failed to load items from API");
    }
  }

  deleteTodo(Todo todo) async {
    http.Response serverResponse = await http.delete(Uri.parse("$baseUrl/${todo.id}$key"));

    if (serverResponse.statusCode == 200) {
      updateTodoList(serverResponse);
    } else {
      throw Exception("Failed to delete item");
    }
  }

  addTodo(Todo newTodo) async {

    http.Response serverResponse = await http.post(
      Uri.parse(baseUrl + key),
      headers: {"Content-Type": "application/json"}, 
      body: jsonEncode(newTodo));

    if (serverResponse.statusCode == 200) {
      updateTodoList(serverResponse);
    } else {
      throw Exception("Failed to add item");
    }
  }

  updateChecked(Todo todo) async {

    http.Response serverResponse = await http.put(
      Uri.parse("$baseUrl/${todo.id}$key"),
      headers: {"Content-Type": "application/json"}, 
      body: jsonEncode(todo.toJson(invertDone: true)));

    if(serverResponse.statusCode == 200) {
    updateTodoList(serverResponse);
    } else {
      throw Exception("Failed to update item");
    }
  }

  updateTodoList(http.Response serverResponse) {
    var returnData = jsonDecode(serverResponse.body);
    _todoList = [];

      for (var todo in returnData) {
        Todo newTodo = Todo.fromJson(todo);
        _todoList.add(newTodo);
      }

      notifyListeners();
  }
}
