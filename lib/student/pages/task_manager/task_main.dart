import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home.dart';

class TaskMain extends StatelessWidget {
  final String user;
  const TaskMain({super.key, required this.user});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Home(
        user: user,
      ),
    );
  }
}
