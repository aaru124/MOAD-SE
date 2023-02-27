import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/exam/exam_home/exam_main.dart';
import 'package:flutter_application_1/student/pages/exam/subject_one/practice_quiz_screen.dart';

class PracticeExam extends StatelessWidget {
  final String user;
  const PracticeExam({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ExamMain(user: user,));
  }
}
