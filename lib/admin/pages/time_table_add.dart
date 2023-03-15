import 'dart:io';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TimeTableAdd extends StatefulWidget {
  @override
  _TimeTableAddState createState() => _TimeTableAddState();
}

class _TimeTableAddState extends State<TimeTableAdd> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _time;
  late String _profName;
  late String _location;
  String? chosenValue;
  String day=DateFormat('EEEE').format(DateTime.now());
  var txt;
  TextEditingController _durationcontroller= new TextEditingController();
  Future<void> update(Map<String, dynamic> data) {
    // Calling the collection to add a new user
    return FirebaseFirestore.instance
        .collection('timetable')
        .doc(day)
        //adding to firebase collection
        .update(data)
        .then((value) => print(""))
        .catchError((error) => print("Event couldn't be added."));
  }
  void updateDay(String? hour, String? img, String location, String name, String prof, String time) async{
    final day_list =
        await FirebaseFirestore.instance.collection('timetable').doc(day).get();
    final data = day_list.data()!;
    int len=data.length;
    data["class-${len+1}"]={
      "hour":hour,
      "img":img,
      "location":location,
      "name":name,
      "prof":prof,
      "time":time,
    };
    update(data);
  }
void change_class_value(String? value) {
    setState(() {
      chosenValue = value;
    });
  }
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      var image = img;
      txt = img?.name;
    });
  }
  CollectionReference students =
      FirebaseFirestore.instance.collection('leave-application');

  Future<void> addApp(String fullName, String uid, String? yr, String? course,
      String email, String l_from, String l_till, String? img) {
    // Calling the collection to add a new user
    return students
        //adding to firebase collection
        .add({
          //Data added in the form of a dictionary into the document.
          'full_name': fullName,
          'uid': uid,
          'year': yr,
          'course': course,
          'email': email,
          'leave-from': l_from,
          'leave-till': l_till,
          'image': img,
        })
        .then((value) => print(""))
        .catchError((error) => print("Student couldn't be added."));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TimeTable Add"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upload Professor's Image: "),
                  IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _name = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Time",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _time = value!;
                  });
                },
              ),
              SizedBox(height:30),
              DropdownButtonFormField<String>(
                value: chosenValue,
                elevation: 5,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                // style: TextStyle(color: Colors.black),

                items: <String>[
                  'AM',
                  'PM',
                  
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: change_class_value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Professor Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a professor name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _profName = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Location",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _location = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    updateDay(chosenValue, txt, _location, _name, _profName, _time);
                    setState(() {
                      chosenValue=null;
                      txt=null;
                      _location="";
                      _name="";
                      _profName="";
                      _time="";
                    });
                    // TODO: Submit the form
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
