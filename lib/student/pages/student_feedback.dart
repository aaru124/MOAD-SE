import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedBack(),
    );
  }
}

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _query=TextEditingController();
  CollectionReference students = FirebaseFirestore.instance.collection('feedback');
Future<void> addApp(String name,String email, String query) {
      // Calling the collection to add a new user
      return students
          //adding to firebase collection
          .add({
            //Data added in the form of a dictionary into the document.
            'full_name': name, 
            'email': email, 
            'query': query,
          })
          .then((value) => print(""))
          .catchError((error) => print(""));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _name,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _query,
                decoration: InputDecoration(labelText: "Query"),
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your query";
                  }
                  return null;
                },
                
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // send query to server or handle it here
                    addApp(_name.text, _email.text, _query.text);
                    _name.clear();
                    _email.clear();
                    _query.clear();
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
