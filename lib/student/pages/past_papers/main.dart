import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/past_papers/faq.dart';

class PastPaperMain extends StatelessWidget {
  final String user;
  PastPaperMain({required this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YearScreen(user: user,),
    );
  }
}
