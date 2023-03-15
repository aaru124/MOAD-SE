import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/post_card.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    
    super.initState();
    getData().then((data) {
      setState(() {
        _data = data;
      });
    });
  }
  late List<DocumentSnapshot> _data = [];

  Future<List<DocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('events').get();
    return querySnapshot.docs;
  }

  late List<String> posts = [];
  late List<String> feed_users = [];
  void makeMovieItem() {
    
    if (_data != null) {
      for (int i = 1; i < _data.length; i++) {
         feed_users.add("user-$i");
         posts.add("post-$i");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    
    makeMovieItem();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 230, 230),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(
              postData: posts[index],
              userData: feed_users[index]);
        },
      ),
    );
  }
}


