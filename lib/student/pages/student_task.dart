import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/task_manager/task_main.dart';

import 'package:google_fonts/google_fonts.dart';

class TaskManager extends StatelessWidget {
  final String user;
  TaskManager({required this.user});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: TaskMain(user:user),
      debugShowCheckedModeBanner: false,
    );
  }
}
