import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/results/result_list.dart';
import 'package:google_fonts/google_fonts.dart';

class SemOneResult extends StatefulWidget {
  final String user;
  SemOneResult({required this.user});
  @override
  _SemOneResult createState() => _SemOneResult();
}

class _SemOneResult extends State<SemOneResult> {
  late String user;
  List calc_gpa(int total_marks) {
    List a = [];
    int gpa = 0;
    String grade = "";
    if (total_marks >= 80) {
      gpa = 10;
      if (total_marks >= 90) {
        grade = "OS";
      } else {
        grade = "AA";
      }
    } else if (total_marks >= 70) {
      gpa = 9;
      grade = "AB";
    } else if (total_marks >= 60) {
      gpa = 8;
      grade = "BB";
    } else if (total_marks >= 55) {
      gpa = 7;
      grade = "BC";
    } else if (total_marks >= 50) {
      gpa = 6;
      grade = "CC";
    } else if (total_marks >= 45) {
      gpa = 5;
      grade = "CD";
    } else if (total_marks >= 40) {
      gpa = 4;
      grade = "DD";
    } else {
      gpa = 0;
      grade = "FF";
    }
    a.add(gpa);
    a.add(grade);
    return a;
  }

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultList(
                              user: user,
                            )))),
            backgroundColor: Colors.white,
            title: Text(
              'Semester One',
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Color(0xff164276),
                ),
              ),
            ),
          ),
          body: ListView(children: [
            Container(
              height: 300,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/logo.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 50),
                            child: Text(
                              "St Xaviers College",
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                  color: Color(0xff164276),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 34,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('No.',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Subject',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Course Code',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('CIA Marks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('End Sem Marks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Total Marks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Grade',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('MOAD')),
                    DataCell(Text('SITS0402')),
                    DataCell(Text('5')),
                    DataCell(Text('5')),
                    DataCell(Text('10')),
                    DataCell(Text('A')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('MOAD')),
                    DataCell(Text('SITS0402')),
                    DataCell(Text('5')),
                    DataCell(Text('5')),
                    DataCell(Text('10')),
                    DataCell(Text('A')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('MOAD')),
                    DataCell(Text('SITS0402')),
                    DataCell(Text('5')),
                    DataCell(Text('5')),
                    DataCell(Text('10')),
                    DataCell(Text('A')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4')),
                    DataCell(Text('MOAD')),
                    DataCell(Text('SITS0402')),
                    DataCell(Text('5')),
                    DataCell(Text('5')),
                    DataCell(Text('10')),
                    DataCell(Text('A')),
                  ]),
                ],
              ),
            ),
          ])),
    );
  }
}
