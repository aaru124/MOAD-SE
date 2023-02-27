import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/results/Year/First_Year/sem_one_result.dart';
import 'package:flutter_application_1/student/pages/results/Year/Third_Year/sem_six_result.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../student_main.dart';
import 'Year/First_Year/sem_two_result.dart';
import 'Year/Second_Year/sem_four_result.dart';
import 'Year/Second_Year/sem_third_result.dart';
import 'Year/Third_Year/sem_five_result.dart';

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
        title: Text("Result",
        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(179, 4, 3, 3),
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage(user:user))),
        
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
                                      builder: (context) => SemOneResult(user: user,)))),
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
                                      builder: (context) => SemTwoResult(user:user)))),
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
                                      builder: (context) => SemThreeResult(user:user)))),
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
                                      builder: (context) => SemFourResult(user:user)))),
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
                                      builder: (context) => SemFiveResult(user:user)))),
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
                                      builder: (context) => SemSixResult(user:user)))),
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
