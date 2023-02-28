import 'package:flutter/material.dart';

class logout extends StatefulWidget {
  @override
  _logoutState createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
        backgroundColor: Colors.green,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert Dialog Box"),
                  content: const Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Show alert Dialog box"),
          ),

// RaidedButton is deprecated and should not be used
// Instead use ElevatedButton

          // child: RaisedButton(
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (ctx) => AlertDialog(
          //         title: const Text("Alert Dialog Box"),
          //         content: const Text("You have raised a Alert Dialog Box"),
          //         actions: <Widget>[

          // FlatButton is deprecated and should not be used
          // Instead use TextButton

          //           FlatButton(
          //             onPressed: () {
          //               Navigator.of(ctx).pop();
          //             },
          //             child: const Text("okay"),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          //   child: const Text("Show alert Dialog box"),
          // ),
        ),
      ),
    );
  }
}
