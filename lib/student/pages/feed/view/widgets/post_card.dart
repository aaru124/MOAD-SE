import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/helper/common.dart';
//import 'package:flutter_application_1/student/pages/feed/model/post_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/pages/post_page.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/inherited_widgets/inherited_post_model.dart';
//import 'package:flutter_application_1/student/pages/feed/view/widgets/post_stats.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/post_time_stamp.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/inherited_widgets/inherited_user_model.dart';
class PostCard extends StatelessWidget {
  final String postData;
  final String userData;
  const PostCard({super.key, required this.postData, required this.userData});

  @override
  Widget build(BuildContext context) {
    final double aspectRatio = isLandscape(context) ? 6 / 2 : 6 / 3;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PostPage(postData: postData);
        }));
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Card(
          
          elevation: 2,
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(4.0),
            child: InheritedPostModel(
              postData: postData,

              child: Column(
                children: <Widget>[
                  _Post(),
                  Divider(color: Colors.grey),
                  _PostDetails(userData:userData),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(children: <Widget>[
        //_PostImage(), 
        _PostTitleSummaryAndTime()]),
    );
  }
}

class _PostTitleSummaryAndTime extends StatelessWidget {
  const _PostTitleSummaryAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('feed-post');
    final String postData = InheritedPostModel.of(context).postData;
    final TextStyle titleTheme = TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.grey);
    final TextStyle summaryTheme = TextStyle(fontSize: 15);
    
    final int flex = isLandscape(context) ? 5 : 3;
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
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding:EdgeInsets.fromLTRB(20,10,0,0),child: Text(data['title'], style: titleTheme)),
                SizedBox(height: 10.0,),
                Padding(padding:EdgeInsets.fromLTRB(20,0,0,0),child:Text(data['summary'], style: summaryTheme)),
                SizedBox(height: 50.0,),
                PostTimeStamp(alignment: Alignment.centerRight),
              ],
            ),
            //PostTimeStamp(alignment: Alignment.centerRight),
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

/*class _PostImage extends StatelessWidget {
  const _PostImage({super.key});

  @override
  Widget build(BuildContext context) {
    final String postData = InheritedPostModel.of(context).postData;
    return Expanded(flex: 2, child: Image.asset(postData.imageURL));
  }
}*/

class _PostDetails extends StatelessWidget {
  final String userData;
  const _PostDetails({super.key,required this.userData});

  @override
  Widget build(BuildContext context) {
    final String postData = InheritedPostModel.of(context).postData;
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
          return Row(
      children: <Widget>[
        Expanded(flex: 3, child: UserDetails(userData: userData)),
        //Expanded(flex: 1, child: PostStats()),
      ],
    );
        }
        return Text("loading");
          }
    );
    
  }
}
