import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/placement/placement_main.dart';

//import 'package:flutter_application_1/student/pages/feed/data/placement/placement_main.dart';

class PlacementManager extends StatelessWidget {
  final String user;
  const PlacementManager({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: PlacementMain(user: user));
  }
}
