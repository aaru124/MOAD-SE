import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/attendance/subjects/subject_one/subject_five.dart';
import 'package:flutter_application_1/student/pages/attendance/subjects/subject_one/subject_four.dart';
import 'package:flutter_application_1/student/pages/attendance/subjects/subject_one/subject_one_main.dart';
import 'package:flutter_application_1/student/pages/attendance/subjects/subject_one/subject_six.dart';
import 'package:flutter_application_1/student/pages/attendance/subjects/subject_one/subject_three.dart';
import 'package:flutter_application_1/student/pages/attendance/subjects/subject_one/subject_two.dart';

import 'package:flutter_application_1/student/student_main.dart';

class AttendanceHome extends StatefulWidget {
  final String user;
  AttendanceHome({required this.user});
  @override
  _AttendanceHomeState createState() => _AttendanceHomeState();
}

class _AttendanceHomeState extends State<AttendanceHome> {
  late String user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage(user: user)))),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectOne(user: user)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16, top: 16),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile Application Dev.",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "SITS0401",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/java.png",
                        width: 36,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectTwo(user: user)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Modern Operating Systems",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "SITS0402",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/java.png",
                        width: 36,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectThree(user: user)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Software Engineering",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "SITS0403",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/java.png",
                        width: 36,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectFour(user: user)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data Structures with Java",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "SITS0404",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/java.png",
                        width: 36,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectFive(user: user)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "STOR",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "SITS0405",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/java.png",
                        width: 36,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectSix(user: user)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cross Faculty Course",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "SSPC0401",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/java.png",
                        width: 36,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
