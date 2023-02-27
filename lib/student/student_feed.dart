import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/feed_main.dart';
import 'package:flutter_application_1/student/pages/feed/feed_main.dart';

class Feed extends StatelessWidget {
  final String user;
  Feed({required this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Leaf(),
    );
  }
}
