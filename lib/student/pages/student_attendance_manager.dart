import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/attendance/attendance_home.dart';

class AttendanceManager extends StatelessWidget {
  final String user;

  const AttendanceManager({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendanceHome(user: user),
    );
  }
}
