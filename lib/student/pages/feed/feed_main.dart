import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/view/pages/home_page.dart';
import 'package:flutter_application_1/student/pages/feed/view/presentation/themes.dart';


class Leaf extends StatelessWidget {
  const Leaf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        brightness: Brightness.light,
        
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
