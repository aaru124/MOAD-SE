import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/student_attendance_manager.dart';
import 'package:flutter_application_1/student/pages/student_task.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/pages/student_time_table.dart';
import 'package:flutter_application_1/student/pages/task_manager/model/todo.dart';
import 'package:flutter_application_1/timetable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/student/pages/task_manager/model/todo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Dashboard extends StatefulWidget {
  final String user;
  Dashboard({required this.user});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }
  //List<ToDo> todosList=[];
  DateTime date = DateTime.now();
    List<Widget> a=[];

  //final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  void makeList(Map<String, dynamic> data){
    for(int i=1;i<=data['task'].length;i++){
      var b=buildTaskItem(data['task'].length, ToDo(id: "${data['task']['task-$i']['id']}", todoText: "${data['task']['task-$i']['text']}", isDone: data['task']['task-$i']['isDone']), Colors.green);
      a.add(b);
    }
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          makeList(data);
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFD4E7FE),
                          Color(0xFFF0F0F0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.6, 0.3])),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.white),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("${data['img']}"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi ${data['name']}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color(0XFF343E87),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Here is a list of schedule",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "You need to check...",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 150,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height - 245,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Today\'s Class',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "(${data.length})",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TimeTable(user: user))),
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0XFF3E3993),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetUserName(DateFormat('EEEE').format(date), 'class-1'),
                      GetUserName(DateFormat('EEEE').format(date), 'class-2'),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Your Task',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "(${data['task'].length})",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TaskManager(user: user)));
                              },
                              child: Text(
                                "See all",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0XFF3E3993),
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: a,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
        return Text("loading");
      },
    );
  }

  Container buildTaskItem(int numDays, ToDo courseTitle, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: (courseTitle.isDone)?BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ):BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              (courseTitle.isDone)?Text(
            "Completed",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ):Text("Not completed",style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 49, 3, 3)),),
          SizedBox(
            height: 5,
          ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            child: Text(
              courseTitle.todoText,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Container buildClassItem(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                " AM",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "Mobile Application Development",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Lab 1,Xavier's Knowledge Center",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&q=80"),
                    radius: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Prof Lydia Fernandes",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
