import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/results/result_year.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../student_main.dart';

class ResultList extends StatefulWidget {
  final String user;
  ResultList({required this.user});
  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
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
        title: Text(
          "Result",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Color.fromARGB(179, 4, 3, 3),
                  fontSize: 25,
                  fontWeight: FontWeight.w600)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(user: user))),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text(
                "First Year",
                style: TextStyle(fontSize: 20),
              ),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          GestureDetector(
                              child: Text(
                                "Semester 1",
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultYear(
                                            user: user,
                                            sem: "1",
                                          )))),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                              child: Text(
                                "Semester 2",
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultYear(user: user, sem: "2")))),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ExpansionTile(
              title: Text(
                "Second Year",
                style: TextStyle(fontSize: 20),
              ),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          GestureDetector(
                              child: Text(
                                "Semester 3",
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultYear(user: user, sem: "3")))),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                              child: Text(
                                "Semester 4",
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultYear(user: user, sem: "4")))),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ExpansionTile(
              title: Text(
                "Third Year",
                style: TextStyle(fontSize: 20),
              ),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          GestureDetector(
                              child: Text(
                                "Semester 5",
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultYear(
                                            user: user,
                                            sem: "5",
                                          )))),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                              child: Text(
                                "Semester 6",
                                style: TextStyle(fontSize: 16),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultYear(
                                            user: user,
                                            sem: "6",
                                          )))),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
