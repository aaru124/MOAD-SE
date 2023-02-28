import 'package:flutter/material.dart';

class TandC extends StatefulWidget {
  @override
  _TandCState createState() => _TandCState();
}

class _TandCState extends State<TandC> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey),
      body: Container(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Welcome!\n\nThese terms and conditions outline the rules and regulations for the use of this app.The following terminology represents the Agreements, Privacy Policy, and Disclaimer notices between the Admin of this College App: \n\n'Professors' and 'Students' strictly refer to login into this app just using the college-allotted Xavier's ID and passwords. \n\nTerms here are also implemented to using of various sources provided to users. \n\nThe college would not be responsible for any actions taken by the  Admin of the app.\n\nParts of this app provides users to add on to post and add the information\n\n\nBy using this app, we assume that you accept these terms and conditions in full. \n\nDo not use the College app if you do not agree to take all the terms and conditions stated on this page.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                value: flag,
                onChanged: (bool? value) {
                  setState(() {
                    flag = !flag;
                  });
                },
                title:
                    Text("I have read and agree to the terms and conditions"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {},
                child: Text(
                  "Accept",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
