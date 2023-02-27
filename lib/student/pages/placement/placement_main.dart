import 'package:flutter/material.dart';

import 'views/home.dart';

class PlacementMain extends StatelessWidget {
  final String user;
  PlacementMain({required this.user});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Job',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(user: user,),
    );
  }
}
