import 'package:shared_preferences/shared_preferences.dart';

class ToDo {
  String? id;
  String todoText;
  bool isDone;
  final prefs =  SharedPreferences.getInstance();

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
   
   ToDo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        todoText = json['todoText'],
        isDone = json['isDone'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'toDoText': todoText,
        'isDone': isDone,
      };

  
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Team Meeting',
      ),
      ToDo(
        id: '05',
        todoText: 'Work on mobile app',
      ),
    ];
  }
}
