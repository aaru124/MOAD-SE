import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/model/post_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
CollectionReference users = FirebaseFirestore.instance.collection('feed-post');

/*class PostStats extends StatelessWidget {
  const PostStats({super.key});

  @override
  Widget build(BuildContext context) {
    final String postData = InheritedPostModel.of(context).postData;
r    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(postData).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _ShowStat(
          icon: Icons.favorite,
          number: postData.reacts,
          color: Colors.red,
        ),
        _ShowStat(
          icon: Icons.remove_red_eye,
          number: postData.views,
          color: Colors.green,
        ),
      ],
    );
        }
        return Text("loading");
          }
);
    
  }
}

class _ShowStat extends StatelessWidget {
  final IconData icon;
  final int number;
  final Color color;

  const _ShowStat({
    super.key,
    required this.icon,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Icon(icon, color: color),
        ),
        Text(number.toString()),
      ],
    );
  }
}*/