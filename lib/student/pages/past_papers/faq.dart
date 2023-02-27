import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/view/pages/post_page.dart';
import 'package:flutter_application_1/student/pages/past_papers/past_paper_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../student_main.dart';

class YearScreen extends StatefulWidget {
  final String user;
  YearScreen({required this.user});
  @override
  _FaQState createState() => _FaQState();
}

class _FaQState extends State<YearScreen> {
  late String user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Past Papers",style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(179, 4, 3, 3),
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),),
        leading: IconButton(
          
          icon: Icon(Icons.arrow_back, color: Colors.black),
               onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage(user:user)))
          
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text(
                "First Year",
                style: TextStyle(fontSize: 20),
              ),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed:(){
                               Navigator.push(
                       context, MaterialPageRoute(builder: (context) => PastPaper(user: user,class_yr:"FY1",len: 15,)));
                            },
                            child: Text("Academic Year 2016-17",style: TextStyle(fontSize: 16),),
                            
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextButton(
                            onPressed:(){
                               Navigator.push(
                       context, MaterialPageRoute(builder: (context) => PastPaper(user: user,class_yr:"FY2",len: 12,)));
                            },
                            child: Text("Academic Year 2017-18",style: TextStyle(fontSize: 16),),
                            
                          ),
                          
                          SizedBox(
                            height: 25,
                          ),
                          TextButton(
                            onPressed:(){
                               Navigator.push(
                       context, MaterialPageRoute(builder: (context) => PastPaper(user: user,class_yr:"FY3",len: 14,)));
                            },
                            child: Text("Academic Year 2018-19",style: TextStyle(fontSize: 16),),
                            
                          ),
                          
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ExpansionTile(
              title: Text(
                "Second Year",
                style: TextStyle(fontSize: 20),
              ),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed:(){
                               Navigator.push(
                       context, MaterialPageRoute(builder: (context) => PastPaper(user: user,class_yr:"SY1",len: 16,)));
                            },
                            child: Text("Academic Year 2016-17",style: TextStyle(fontSize: 16),),
                            
                          ),
                          
                          SizedBox(
                            height: 25,
                          ),
                          TextButton(
                            onPressed:(){
                               Navigator.push(
                       context, MaterialPageRoute(builder: (context) => PastPaper(user: user,class_yr:"SY2",len: 22,)));
                            },
                            child: Text("Academic Year 2017-18",style: TextStyle(fontSize: 16),),
                            
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextButton(
                            onPressed:(){
                               Navigator.push(
                       context, MaterialPageRoute(builder: (context) => PastPaper(user: user,class_yr:"SY3",len: 30,)));
                            },
                            child: Text("Academic Year 2018-19",style: TextStyle(fontSize: 16),),
                            
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            /*ExpansionTile(
              title: Text(
                "Third Year",
                style: TextStyle(fontSize: 20),
              ),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            "Academic Year 2016-17",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Academic Year 2017-18",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Academic Year 2019-20",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
