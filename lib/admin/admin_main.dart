import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/pages/ecc_add.dart';
import 'package:flutter_application_1/admin/pages/feed_add.dart';
import 'package:flutter_application_1/admin/pages/feedback.dart';
import 'package:flutter_application_1/admin/pages/leave_application.dart';
import 'package:flutter_application_1/admin/pages/student_add.dart';
import 'package:flutter_application_1/admin/pages/time_table_add.dart';
import 'package:flutter_application_1/admin/pages/train_concession.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:google_fonts/google_fonts.dart';


class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => new _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
    final FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADMIN PAGE",style: TextStyle(color: Colors.white,fontSize: 25),),backgroundColor: Colors.black,),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
  
        children: <Widget>[
          GestureDetector(
            onTap: signOut,
            child:Container(child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          Icon(Icons.logout,size: 13,),
          Text("Logout",style: TextStyle(color: Colors.black,fontSize: 13,decoration: TextDecoration.underline),),

          ],) ,
          alignment: Alignment.topRight,) ,
          ),
          
          SizedBox(
            height: 100,
          ),
          Flexible(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              children: [
                
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/calendar.png",
                          width: 60,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentAdd()));
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Add Student",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/calendar.png",
                          width: 60,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedAdd()));
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Add Feed",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/calendar.png",
                          width: 60,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ECCAdd()));
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Update ECC",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/calendar.png",
                          width: 60,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimeTableAdd()));
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Add TimeTable",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
