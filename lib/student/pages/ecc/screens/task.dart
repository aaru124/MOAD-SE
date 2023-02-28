import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/pages/ecc/main.dart';

class TaskScreen extends StatefulWidget {
  final String user;
  final int total;
  TaskScreen({required this.user, required this.total});
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int points = 5;
  bool flag = false;
  late String user;
  late int total;
  late Map<String, dynamic> data1;
  void initState() {
    total = widget.total;
    user = widget.user;
    super.initState();
    getData().then((data) {
      setState(() {
        _data = data;
      });
    });
    getEcc();
  }

  late int ctr = total;

  Future<List<DocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('attended-event').get();
    return querySnapshot.docs;
  }

  late DocumentSnapshot snapshot;
  dynamic d1;
  void getEcc() async {
    final data = await FirebaseFirestore.instance
        .collection("total-ecc")
        .doc('ecc')
        .get();
    snapshot = data;
    setState(() {
      d1 = snapshot.data() as dynamic;
    });
    if (d1 != null) {
      flag = true;
    }
  }

  late List<DocumentSnapshot> _data;

  @override
  Widget build(BuildContext context) {
    var a = 0;
    if (d1 != null) {
      flag = true;

      a = d1['value'];
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ECCHome(
                          user: user,
                          total: total,
                        )))),
        backgroundColor: Colors.white,
      ),
      body: (flag == true)
          ? Container(
              child: Row(children: [
              ///Container for Content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: Color.fromARGB(255, 29, 3, 34)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your ECC Points: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text("${a}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ///For spacing
                      SizedBox(
                        height: 4,
                      ),

                      Row(
                        children: [
                          ///Text
                          Text(
                            "Attended Events",
                            style: TextStyle(
                              fontSize: 40,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 44, 51, 54),
                            ),
                          ),

                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      ///List of all the task
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            ///Change appearance of Completed Task
                            ///Say index 1 is completed
                            Map<String, dynamic> data =
                                _data[index].data() as Map<String, dynamic>;
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueGrey),
                                  color: Colors.purple[400]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///Show completed check
                                  ///Task Title
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: _data[index].data() != null
                                            ? Text(
                                                //"aaaaa",
                                                "${data['name']}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              )
                                            : Text("hello"),
                                      ),

                                      ///For Space

                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container()
                                    ],
                                  ),

                                  ///For Space
                                  SizedBox(
                                    height: 8,
                                  ),

                                  ///Task Detail
                                  Row(
                                    children: [
                                      Text(
                                        //"123",
                                        "${data['date']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.white70),
                                      ),
                                      Spacer(),
                                      Text(
                                        //"2",
                                        "${data['pts']}" + " ECC",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.white70),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            height: 16,
                            color: Colors.transparent,
                          ),
                          itemCount: _data.length,
                        ),
                      ),

                      ///For spacing
                      SizedBox(
                        height: 16,
                      ),

                      ///Button for add new task
                    ],
                  ),
                ),
              ),
            ]))
          : CircularProgressIndicator(),
    );
  }
}
