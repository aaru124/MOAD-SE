import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/helper/common.dart';
import 'package:flutter_application_1/student/pages/feed/model/user_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/inherited_widgets/inherited_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserDetails extends StatelessWidget {
  final String userData;

  const UserDetails({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return InheritedUserModel(
      userData: userData,
      child: Container(
        child: Row(children: <Widget>[_UserImage(), _UserNameAndEmail()]),
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('feed-user');
    final String userData = InheritedUserModel.of(context).userData;
    final TextStyle nameTheme = TextStyle(fontSize: 15);
    final TextStyle emailTheme = TextStyle(fontSize: 8);
    final int flex = isLandscape(context) ? 10 : 5;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userData).get(),
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
          return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(data['name'], style: nameTheme),
            SizedBox(height: 2.0),
            Text(data['email'], style: emailTheme),
          ],
        ),
      ),
    );
        }
        return Text("loading");
          }
    );

    
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    final String userData = InheritedUserModel.of(context).userData;
    CollectionReference users = FirebaseFirestore.instance.collection('feed-user');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userData).get(),
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
          return Expanded(
      flex: 1,
      child: CircleAvatar(backgroundImage: AssetImage(data['image'])),
    );
        }
        return Text("loading");
          }
    );
    
  }
}
