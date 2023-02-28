import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/attendance/attendance_home.dart';
import 'package:flutter_application_1/student/pages/student_attendance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectFour extends StatefulWidget {
  final String user;
  SubjectFour({super.key, required this.user});

  @override
  _SubjectOneState createState() => _SubjectOneState();
}

class _SubjectOneState extends State<SubjectFour> {
  late String user;
  int _counterattend = 0;
  int _counterabsent = 0;
  double _countertotal = 0;
  var missed = 0;
  Color a = Colors.black;

  void _totalCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _countertotal =
          (((_counterattend) / (_counterabsent + _counterattend)) * 100);
      if (_countertotal >= 75) {
        a = Colors.green;
      } else {
        a = Colors.red;
      }
      prefs.setDouble('${user}countertotal4', _countertotal);
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counterattend = ((prefs.getInt('${user}counterattend4') ?? 0) + 1);
      prefs.setInt('${user}counterattend4', _counterattend);
    });
  }

  void _decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counterabsent = ((prefs.getInt('${user}counterabsent4') ?? 0) + 1);
      prefs.setInt('${user}counterabsent4', _counterabsent);
    });
  }

  void _incrementCounterundo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counterattend = ((prefs.getInt('${user}counterattend4') ?? 0) - 1);
      prefs.setInt('${user}counterattend4', _counterattend);
    });
  }

  void _decrementCounterundo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counterabsent = ((prefs.getInt('${user}counterabsent4') ?? 0) - 1);
      prefs.setInt('${user}counterabsent4', _counterabsent);
    });
  }

  void loadCounter() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    SharedPreferences prefs3 = await SharedPreferences.getInstance();
    setState(() {
      _counterattend = (prefs1.getInt('${user}counterattend4') ?? 0);
      _counterabsent = (prefs2.getInt('${user}counterabsent4') ?? 0);
      _countertotal = (prefs3.getDouble('${user}countertotal4') ?? 0);
    });
  }

  void calculateMissing() {
    int calc =
        (((75 * (_counterabsent + _counterattend)) - (100 * (_counterattend))) /
                25)
            .ceil();
    setState(() {
      missed = calc;
    });
  }

  @override
  void initState() {
    user = widget.user;
    super.initState();
    loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AttendanceManager(user: user)))),
          title: Text("Sample"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: (Column(children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'Percentage',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${_countertotal.toStringAsFixed(2)}' + ' %',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _totalCounter();
                          calculateMissing();
                          if (missed <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'You have reached your goal! Keep attending lectures to maintain it.')),
                            );
                          } else if (missed == 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'You need to attend $missed more class to reach your goal.')),
                            );
                          } else if (missed > 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'You need to attend $missed more classes to reach your goal')),
                            );
                          }
                        },
                        child: Text('Update'),
                      ),
                    ])))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                  Widget>[
                Column(children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: (MediaQuery.of(context).size.width * 0.9) * 0.47,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: (Column(
                        children: [
                          Text(
                            'Attended',
                          ),
                          Text(
                            '$_counterattend',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      )))
                ]),
                Column(children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: (MediaQuery.of(context).size.width * 0.9) * 0.47,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: (Column(
                        children: [
                          Text(
                            'Missed',
                          ),
                          Text(
                            '$_counterabsent',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      )))
                ])
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: (Column(children: [
                      Text(
                        'Goal',
                      ),
                      Text(
                        '75',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ])))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: a, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: (Column(children: [
                      Text(
                        'Status',
                        style: TextStyle(color: a),
                      ),
                      Text(
                        '${_countertotal.toStringAsFixed(2)}',
                        style: TextStyle(color: a, fontSize: 30),
                      ),
                    ])))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.9,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Add Attendance"),
                              Column(
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: _incrementCounter,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: _incrementCounterundo,
                                    child: Icon(Icons.undo),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.9,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Missed Attendance"),
                              Column(
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: _decrementCounter,
                                    child: Icon(Icons.remove),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: _decrementCounterundo,
                                    child: Icon(Icons.undo),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ])),
          ),
        ));
  }
}
