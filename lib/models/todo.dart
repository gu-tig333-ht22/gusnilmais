class Todo {
  String? id;
  String title;
  bool done;

  Todo({this.id, required this.done, required this.title});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      done: json["done"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "done": done,
      "title": title
    };
  }

}