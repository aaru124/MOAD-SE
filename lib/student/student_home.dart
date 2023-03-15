import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/student_dashboard.dart';
import 'package:flutter_application_1/student/student_feed.dart';
import 'package:flutter_application_1/student/student_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Nav extends StatefulWidget {
  final String user;
  Nav({required this.user});
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  late String user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  int _selectedIndex = 0;
  late List<Widget> _widgetOptions = <Widget>[
    Dashboard(user: user),
    Feed(user: user),
    PopUp(user: user),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
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
            label: ('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: ('Popup'),
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
