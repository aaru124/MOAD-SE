import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/student/pages/task_manager/model/todo.dart';

import 'screens/home.dart';

class TaskMain extends StatelessWidget {
  final String user;

  TaskMain({super.key, required this.user});
  List<ToDo> todoslist = [];

  void makeTask() async {
    final event_list =
        await FirebaseFirestore.instance.collection('users').doc(user).get();
    final data = event_list.data()!;
    print(data["task"].length);
    for (int i = 0; i < data['task'].length; i++) {
      ToDo a = ToDo(
          id: data['task']["task-${i + 1}"]["id"],
          todoText: data['task']["task-${i + 1}"]["text"],
          isDone: data['task']["task-${i + 1}"]["isDone"]);
      todoslist.add(a);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    makeTask();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Home(
        user: user,
        todosList: todoslist,
      ),
    );
  }
}
