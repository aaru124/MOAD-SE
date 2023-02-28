import 'package:flutter/material.dart';
//import 'package:flutter_application_1/student/pages/feed/model/post_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/presentation/themes.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('feed-post');

class PostTimeStamp extends StatelessWidget {
  final Alignment alignment;

  const PostTimeStamp({
    super.key,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    final String postData = InheritedPostModel.of(context).postData;
    final TextStyle timeTheme = TextThemes.dateStyle;
    return FutureBuilder<DocumentSnapshot>(
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
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              child: Text(data['postTime'], style: timeTheme),
            );
          }
          return Text("loading");
        });
  }
}
