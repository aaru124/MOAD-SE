import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/results/result_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultYear extends StatefulWidget {
final String user;
final String sem;
ResultYear({required this.user, required this.sem});
  @override
  _SemSixResult createState() => _SemSixResult();
}

class _SemSixResult extends State<ResultYear> {
  late String user;
  late String sem;
  List calc_gpa(int total_marks){
    List a=[];
    int gpa=0;
    String grade="";
    if (total_marks>=80){
      gpa=10;
      if(total_marks>=90){
        grade="OS";
      }
      else{
        grade="AA";
      }
    }
    else if (total_marks>=70){
      gpa=9;
      grade="AB";
    }
    else if (total_marks>=60){
      gpa=8;
      grade="BB";
    }
    else if (total_marks>=55){
      gpa=7;
      grade="BC";
    }
    else if (total_marks>=50){
      gpa=6;
      grade="CC";

    }
    else if (total_marks>=45){
      gpa=5;
      grade="CD";
    }
    else if (total_marks>=40){
      gpa=4;
      grade="DD";
    }
    else{
      gpa=0;
      grade="FF";
    }
    a.add(gpa);
    a.add(grade);
    return a;
  }
  @override
  void initState() {
    user = widget.user;
    sem=widget.sem;
    super.initState();
  }
  num sgpa=0;
  List<DataRow> a= [];
  void makeRow(Map<String, dynamic> data){
    
    for(int i=0; i<data.length; i++){
      sgpa+=calc_gpa(data['${i+1}']["total"])[0];
      DataRow b=DataRow(cells: [
                    DataCell(Text('${data['${i+1}']['srno']}')),
                    DataCell(Text('${data['${i+1}']['name']}')),
                    DataCell(Text('${data['${i+1}']['cc']}')),
                    DataCell(Text('${data['${i+1}']['cia-marks']}')),
                    DataCell(Text('${data['${i+1}']['endsem']}')),
                    DataCell(Text('${data['${i+1}']['total']}')),
                    DataCell(Text('${calc_gpa(data['${i+1}']["total"])[1]}')),
                    DataCell(Text('${calc_gpa(data['${i+1}']["total"])[0]}')),
                  ]);
      a.add(b);
    }
    
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('result');
    

    
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc("sem-$sem").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Image.asset("assets/oops.png",height: 150,),
            Text("You have not appeared in this semester yet", style: TextStyle(color: Colors.grey),)
          ],
          ),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar:  AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultList(user: user,)))),
            backgroundColor: Colors.white,
            title: Text(
              'Semester $sem',
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Color(0xff164276),
                ),
              ),
            ),
          ),
            body:Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Image.asset("assets/oops.png",height: 150,),
            SizedBox(height: 15,),
            Text("You have not appeared in this exam yet!", style: TextStyle(color: Colors.grey,fontSize: 12),)
          ],
          ),
            ),
          ),
      
          );
        }

        if (snapshot.connectionState == ConnectionState.done ) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          makeRow(data);
          a.add(
            DataRow(cells: [
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('SGPA',style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataCell(Text('${(sgpa/data.length).toStringAsFixed(2)}')),
                  ],
          ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultList(user: user,)))),
            backgroundColor: Colors.white,
            title: Text(
              'Semester $sem',
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Color(0xff164276),
                ),
              ),
            ),
          ),
          body: ListView(children: [
            Container(
              height: 300,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/logo.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 50),
                            child: Text(
                              "St Xaviers College",
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                  color: Color(0xff164276),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 34,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('No.',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Subject',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Course Code',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('CIA Marks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('End Sem Marks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Total Marks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Grade',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                   DataColumn(
                      label: Text('Grade Point',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                              
                ],
                rows: a,
              ),
            ),
          ])),
    );
        }
        return CircularProgressIndicator();
          }
    );
  }
}
