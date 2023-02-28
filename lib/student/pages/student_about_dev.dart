import 'package:flutter/material.dart';

class AboutDev extends StatefulWidget {
  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/logo1.png",
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              "College Management System",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8),
            Text(
              "Version 1.0.0",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16),
            Text(
              "Welcome!\n",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                "One App for all your study-related needs.\n\nThis is designed considering the needs of students in college.\n\nDiscover various features provided by this app.\n\nKeep track of your daily activities, routines, and tasks.\n\nView daily assignment Updates\n\nMaintain track of ECC Credit points.Track total lectures attended.\n\nGet Access to past papers, attend online exams, and many more features.\n\nThis app contains features that are useful to students as well as staff working in the college."),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text("Visit"),
            )
          ],
        ),
      ),
    );
  }
}
