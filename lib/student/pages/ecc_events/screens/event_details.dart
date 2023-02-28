import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter_application_1/student/pages/ecc/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event.dart';
import 'package:flutter_application_1/student/student_main.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  final String user;

  int total;

  MovieDetailsScreen(
      {super.key,
      required this.user,
      required this.movie,
      required this.total});
  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late String user;
  late int total;
  late Movie movie;
  Color a = Colors.black;
  Color b = Colors.white;
  bool _isButtonDisabled = false;

  @override
  void initState() {
    total = widget.total;
    movie = widget.movie;
    user = widget.user;
    super.initState();
  }

  CollectionReference event =
      FirebaseFirestore.instance.collection('attended-event');
  CollectionReference ecc = FirebaseFirestore.instance.collection('total-ecc');
  CollectionReference event_list =
      FirebaseFirestore.instance.collection('events');
  Future<void> addApp(String name, String date, int pts) {
    // Calling the collection to add a new user
    return event
        //adding to firebase collection
        .add({
          //Data added in the form of a dictionary into the document.
          'name': name,
          'date': date,
          'pts': pts,
        })
        .then((value) => print(""))
        .catchError((error) => print("Event couldn't be added."));
  }

  Future<void> addEcc(int total) {
    // Calling the collection to add a new user
    return ecc
        .doc("ecc")
        //adding to firebase collection
        .update({
          //Data added in the form of a dictionary into the document.
          'value': total,
        })
        .then((value) => print(""))
        .catchError((error) => print("ECC couldn't be updated."));
  }

  Future<void> updateDisabled() {
    int ind = movie.srno;
    // Calling the collection to add a new user
    return event_list
        .doc("event-${ind}")
        //adding to firebase collection
        .update({
          //Data added in the form of a dictionary into the document.
          'disabled': true,
        })
        .then((value) => print(""))
        .catchError((error) => print("button couldn't be updated."));
  }

  void make_disabled() {
    setState(() {
      updateDisabled();
      movie.button = true;
      _isButtonDisabled = true;
      a = Colors.grey;
      b = Color.fromARGB(255, 131, 129, 129);
      total = total + movie.ecc;
      addApp(movie.title, movie.year, movie.ecc);
      addEcc(total);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ECCHome(user: user, total: total))),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: a,
              ),
              onPressed: movie.button ? null : make_disabled,
              child: Text(
                "Attend",
                style: TextStyle(color: b),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                movie.imageUrl,
                height: 700,
              ),
              /*Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(movie.year.toString(),
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(movie.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0)),
            ),*/
            ],
          ),
        ),
      ),
    );
  }
}
