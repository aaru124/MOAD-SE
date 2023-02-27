import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/results/result_list.dart';
import 'package:flutter_application_1/student/student_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Fee extends StatefulWidget {
  final String user;
  Fee({required this.user});
  @override
  _Fee createState() => _Fee();
}

class _Fee extends State<Fee> {
  late String user;
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
                    context, MaterialPageRoute(builder: (context) => HomePage(user:user)))),
            backgroundColor: Colors.white,
            title: Text(
              'Fee Slip',
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
                      label: Text('UID',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Student Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Program',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Amount',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Posting Date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('215000')),
                    DataCell(Text('Test')),
                    DataCell(Text('BSCIT')),
                    DataCell(Text('0000')),
                    DataCell(Text('00-00-0000')),
                    DataCell(Text('Paid')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('215000')),
                    DataCell(Text('Test')),
                    DataCell(Text('BSCIT')),
                    DataCell(Text('0000')),
                    DataCell(Text('00-00-0000')),
                    DataCell(Text('Paid')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('215000')),
                    DataCell(Text('Test')),
                    DataCell(Text('BSCIT')),
                    DataCell(Text('0000')),
                    DataCell(Text('00-00-0000')),
                    DataCell(Text('Paid')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4')),
                    DataCell(Text('215000')),
                    DataCell(Text('Test')),
                    DataCell(Text('BSCIT')),
                    DataCell(Text('0000')),
                    DataCell(Text('00-00-0000')),
                    DataCell(Text('Paid')),
                  ]),
                ],
              ),
            ),
          ])),
    );
  }
}
