import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/student/pages/student_about_app.dart';
import 'package:flutter_application_1/student/pages/student_faq.dart';
import 'package:flutter_application_1/student/pages/student_t&c.dart';
import 'package:flutter_application_1/student/pages/student_train_concession.dart';
import 'package:flutter_application_1/student/pages/student_leave_apply.dart';
import 'package:flutter_application_1/student/pages/student_attendance_manager.dart';
import 'package:flutter_application_1/student/student_home.dart';
import 'pages/student_feedback.dart';

import 'pages/student_leave_apply.dart';
import 'drawer_header.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentMainScreen extends StatelessWidget {
  final String user;
  StudentMainScreen({required this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(user: user),
    );
  }
}

class HomePage extends StatefulWidget {
  final String user;
  HomePage({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  late String user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = Nav(user: user);
    } else if (currentPage == DrawerSections.leave) {
      container = Leave();
    } else if (currentPage == DrawerSections.train) {
      container = TrainConcession();
    } else if (currentPage == DrawerSections.term) {
      container = TandC();
    } else if (currentPage == DrawerSections.faq) {
      container = FaQ();
    } else if (currentPage == DrawerSections.about) {
      container = AboutDev(
        user: user,
      );
    } else if (currentPage == DrawerSections.send_feedback) {
      container = FeedBack();
    } else if (currentPage == DrawerSections.logout) {
      container = AlertDialog(
        title: const Text(""),
        content: const Text(
          "Do you really want to log out?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  signOut();
                },
                child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      const Text(
                        "yes",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ])),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: () {
                  //Navigator.of(context).pop();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentMainScreen(
                                user: user,
                              )));
                },
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("no",
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                )),
              ),
            ],
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          SizedBox(
            height: 10, //height of button
            width: 150,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttendanceManager(user: user)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.cast_for_education,
                      color: Color.fromARGB(255, 40, 36, 36),
                    ),
                    Text(
                      "Attendance",
                      style: TextStyle(color: Color.fromARGB(255, 40, 36, 36)),
                    ),
                  ],
                )),
          )
        ],
      ),
      body: container,
      drawer: Drawer(
        width: 300,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(user: user),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Leave Application", Icons.people_alt_outlined,
              currentPage == DrawerSections.leave ? true : false),
          menuItem(3, "Train Concession", Icons.event,
              currentPage == DrawerSections.train ? true : false),
          Divider(),
          menuItem(4, "Terms & Conditions", Icons.notes,
              currentPage == DrawerSections.term ? true : false),
          menuItem(5, "FAQs", Icons.question_answer,
              currentPage == DrawerSections.faq ? true : false),
          menuItem(6, "About the App", Icons.notifications_outlined,
              currentPage == DrawerSections.about ? true : false),
          Divider(),
          menuItem(9, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          Divider(),
          menuItem(10, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.leave;
            } else if (id == 3) {
              currentPage = DrawerSections.train;
            } else if (id == 4) {
              currentPage = DrawerSections.term;
            } else if (id == 5) {
              currentPage = DrawerSections.faq;
            } else if (id == 6) {
              currentPage = DrawerSections.about;
            } else if (id == 9) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 10) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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

enum DrawerSections {
  dashboard,
  leave,
  train,
  term,
  faq,
  about,
  settings,
  notification,
  send_feedback,
  logout,
}
