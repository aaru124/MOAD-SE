import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedbackDetail {
  final String name;
  final String message;
  final String email;

  FeedbackDetail(
      {required this.name, required this.message, required this.email});
}

class FeedbackDetailList extends StatelessWidget {
  final List<FeedbackDetail> feedbackDetails = [
    FeedbackDetail(
        name: "John Smith",
        message: "Software Engineer",
        email: "johnsmith@example.com"),
    FeedbackDetail(
        name: "Jane Doe",
        message: "Data Analyst",
        email: "janedoe@example.com"),
    FeedbackDetail(
        name: "Bob Johnson",
        message: "Product Manager",
        email: "bobjohnson@example.com"),
  ];
  void makeFeedback() async{
    
  }
  @override
  Widget build(BuildContext context) {
    makeFeedback();
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: ListView.builder(
        itemCount: feedbackDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(feedbackDetails[index].name),
            subtitle: Text(feedbackDetails[index].message),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FeedbackDetails(feedbackDetail: feedbackDetails[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FeedbackDetails extends StatelessWidget {
  final FeedbackDetail feedbackDetail;

  FeedbackDetails({required this.feedbackDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(feedbackDetail.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Message:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(feedbackDetail.message),
            SizedBox(height: 16.0),
            Text(
              "Email:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(feedbackDetail.email),
          ],
        ),
      ),
    );
  }
}
