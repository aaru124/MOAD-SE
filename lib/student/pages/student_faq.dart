import 'package:flutter/material.dart';

class FaQ extends StatefulWidget {
  @override
  _FaQState createState() => _FaQState();
}

class _FaQState extends State<FaQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text(
                  "\n\nWhat is the purpose of College Management system?\n\n"),
              children: <Widget>[
                Container(
                    //padding: EdgeInsets.only(left: 5, right: 16),
                    child: Text(
                        "College Management App is an application designed to help students and professors of St Xavier's College to manage their day-to-day activities efficiently. This application can allow students and staff to collaborate on a single platform and improve their performance.\n\n")),
              ],
            ),
            ExpansionTile(
              title: Text(
                  "\n\nHow does the attendance tracking feature work?\n\n"),
              children: <Widget>[
                Container(
                    //padding: EdgeInsets.only(left: 5, right: 16),
                    child: Text(
                        "The tracking feature in this application is very easy to go. We need to add the count with the course name when we attend that lecture at the particular lecture hour. This way students can maintain a record of everyday attendance of each course.\n\n")),
              ],
            ),
            ExpansionTile(
              title: Text(
                  "\n\nWhat are the advantages of using a college management system?\n\n"),
              children: <Widget>[
                Container(
                    //padding: EdgeInsets.only(left: 5, right: 16),
                    child: Text(
                    "Using this application gives students access to many features such as Ecc and attendance tracking, accessing past papers, track over daily activities, etc.\n\n")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
