import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/ecc/screens/task.dart';
import 'package:flutter_application_1/student/pages/ecc_events/models/event.dart';
import 'package:provider/provider.dart';

class ECCHome extends StatefulWidget {
  final int total;
  final String user;
  ECCHome({required this.user, required this.total});
  @override
  _ECCHomeState createState() => _ECCHomeState();
}

class _ECCHomeState extends State<ECCHome> {
  late String user;
  late int total;
  late List<Widget> _widgetOptions = [];
  bool flag = false;
  @override
  void initState() {
    user = widget.user;
    total = widget.total;
    super.initState();
    getData();
  }

  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  late DocumentSnapshot snapshot;
  dynamic d1;
  void getData() async {
    final data = await FirebaseFirestore.instance
        .collection("total-ecc")
        .doc('ecc')
        .get();
    snapshot = data;
    setState(() {
      d1 = snapshot.data() as dynamic;
    });
    if (d1 != null) {
      flag = true;
      _widgetOptions = <Widget>[
        Movie(
          title: "",
          imageUrl: "",
          year: "",
          ecc: 0,
          button: false,
          user: user,
          total: d1['value'],
          srno: 0,
        ),
        TaskScreen(user: user, total: d1['value']),
      ];
    }
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (flag == true)
          ? Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            )
          : CircularProgressIndicator(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: ('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: ('Tracker'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
