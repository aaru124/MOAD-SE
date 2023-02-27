import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/pages/ecc/main.dart';

class Ecc_Tracker extends StatefulWidget {
  const Ecc_Tracker({super.key,required this.user});
final String user;
  @override
  State<Ecc_Tracker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Ecc_Tracker> {
  late String user;
  void initState() {
    user=widget.user;
    //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const _color = const Color(0xff008037);
    return MaterialApp(
      title: "Bucker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
        primaryColor: _color,
      ),

      home: ECCHome(user:user,total: 0,),
      // home: TransactionScreen(),
    );
  }
}