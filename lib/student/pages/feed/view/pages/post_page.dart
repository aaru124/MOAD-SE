import 'package:flutter/material.dart';
//import 'package:flutter_application_1/student/pages/feed/model/post_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/presentation/themes.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/post_time_stamp.dart';
//import 'package:flutter_application_1/student/pages/feed/view/widgets/user_details_with_follow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/pages/feed/view/pages/home_page.dart';

CollectionReference users = FirebaseFirestore.instance.collection('feed-post');

class PostPageKeys {
  static final ValueKey wholePage = ValueKey("wholePage");
  static final ValueKey bannerImage = ValueKey("bannerImage");
  static final ValueKey summary = ValueKey("summary");
  static final ValueKey mainBody = ValueKey("mainBody");
}

class PostPage extends StatelessWidget {
  final String postData;
  const PostPage({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: InheritedPostModel(
        postData: postData,
        child: ListView(
          key: PostPageKeys.wholePage,
          children: <Widget>[
            GestureDetector(  
              onTap: (){
                Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        }));
              },          
              child: Container(padding:EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: Text("Go Back",style: TextStyle(decoration: TextDecoration.underline,fontSize: 10,color: Colors.black))))
              ,

            //_BannerImage(key: PostPageKeys.bannerImage),
            _NonImageContents(),
          ],
        ),
      ),
    );
  }
}

class _NonImageContents extends StatelessWidget {
  const _NonImageContents({super.key});
  @override
  Widget build(BuildContext context) {
    final String postData = InheritedPostModel.of(context).postData;
    CollectionReference users =
        FirebaseFirestore.instance.collection('feed-post');
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
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _Summary(key: PostPageKeys.summary),
                  PostTimeStamp(),
                  SizedBox(
                    height: 40.0,
                  ),
                  _MainBody(key: PostPageKeys.mainBody),
                  /*UserDetailsWithFollow(
            userData: data['author'],
          ),*/
                  SizedBox(height: 8.0),
                  //PostStats(),
                  //CommentsList(),
                ],
              ),
            );
          }
          return Text("Loading");
        });
  }
}

/*class _BannerImage extends StatelessWidget {
  const _BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        InheritedPostModel.of(context).postData.imageURL,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}*/

class _Summary extends StatelessWidget {
  const _Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(InheritedPostModel.of(context).postData).get(),
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
              padding: const EdgeInsets.all(20.0),
              child: Text(
                data['summary'],
                style: TextThemes.title,
              ),
            );
          }
          return Text("loading");
        });
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(InheritedPostModel.of(context).postData).get(),
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
              padding: const EdgeInsets.all(20),
              child: Text(
                data['body'],
                style: TextThemes.body1,
              ),
            );
          }
          return Text("loading");
        });
  }
}
