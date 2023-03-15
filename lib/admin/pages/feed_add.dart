import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FeedAdd extends StatefulWidget {
  @override
  _FeedAddState createState() => _FeedAddState();
}

class _FeedAddState extends State<FeedAdd> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _summaryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _authorNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  late File _image;

  CollectionReference post =FirebaseFirestore.instance.collection('feed-post');
  CollectionReference user =FirebaseFirestore.instance.collection('feed-user'); 
  
  void setPost( String author, String body,String date, String smry,String title) async{
    final QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('feed-post').get();
    final int documents = qSnap.docs.length;
    int len=documents;
    var a={
          //Data added in the form of a dictionary into the document.
          'author': author,
          'body': body,
          'id': '${len+1}',
          'postTime': date,
          'summary': smry,
          'title': title,
        };
    await post.doc("post-${len+1}").set(a).then((value) => print("")).catchError((error) => print("Student couldn't be added."));
  }
  void setUser(String email, String? img, String name, String date) async{
    final QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('feed-user').get();
    final int documents = qSnap.docs.length;
    int len=documents;
    var a={
          //Data added in the form of a dictionary into the document.
          'email': email,
          'id': "${len+1}",
          'image': "assets/images/${img}",
          'name': name,
          'postTime': date,
        };
    await user.doc("user-${len+1}").set(a);
  }

  var txt;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      var image = img;
      txt = img?.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed Add"),
      ),
      body: SingleChildScrollView(child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(
                  labelText: "Summary",
                ),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the summary';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: "Date",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorNameController,
                decoration: InputDecoration(
                  labelText: "Author Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the author name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Upload the Professor's Image",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87)),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.upload_file),
                          Text('Upload'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //TODO: Submit the form data
                      setPost(_authorNameController.text,_descriptionController.text, _dateController.text, _summaryController.text, _titleController.text);
                      setUser(_emailController.text, txt, _authorNameController.text, _dateController.text);
                      _authorNameController.clear();
                      _descriptionController.clear();
                      _summaryController.clear();
                      _titleController.clear();
                      _dateController.clear();
                      _emailController.clear();
                      
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
