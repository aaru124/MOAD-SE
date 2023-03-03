import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/helper/demo_values.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 230, 230),
      
      body: ListView.builder(
        itemCount: DemoValues.posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(
              postData: DemoValues.posts[index],
              userData: DemoValues.feed_users[index]);
        },
      ),
    );
  }
}
