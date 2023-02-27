/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup_screen.dart';
import 'package:flutter_application_1/student/student_main.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 300,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/logo.png",
                  height: 90,
                  width: 90,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 50),
                        child: Text(
                          "Login",
                          style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                              color: Color(0xff164276),
                              fontWeight: FontWeight.w900,
                              fontSize: 34,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            "E-Mail",
            style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                color: Color(0xff8fa1b6),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            cursorColor: Colors.red,
            decoration: InputDecoration(
              hintText: "Enter Email",
              hintStyle: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Color(0xffc5d2e1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffdfe8f3)),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Password",
            style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                color: Color(0xff8fa1b6),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            cursorColor: Colors.red,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Passowrd",
              hintStyle: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Color(0xffc5d2e1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffdfe8f3)),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Write Click Listener Code Here
            },
            child: Text("Forget Password?"),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudentMainScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 50),
            decoration: const BoxDecoration(
              color: Color(0xff008fff),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentMainScreen()),
                ),
              },
              child: Text(
                "Login",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text("Don't Have Any Account?  "),
        //       GestureDetector(
        //         child: Text(
        //           "Register Now",
        //           style: TextStyle(color: Color(0xffF5591F)),
        //         ),
        //         onTap: () {
        //           // Write Tap Code Here.
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => SignUpScreen(),
        //               ));
        //         },
        //       )
        //     ],
        //   ),
        // )
      ],
    )));
  }
}
*/