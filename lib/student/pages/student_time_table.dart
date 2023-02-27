import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/timetable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/student/student_main.dart';
class TimeTable extends StatefulWidget {
 final String user;
  const TimeTable({super.key,required this.user});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  late String user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }
  DateTime date= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage(user:user)))),
        backgroundColor: Colors.white,
      ),
      body: Container(
        
        child: Column(children: [
          Container(alignment: Alignment.topRight,child:Text('${DateFormat('EEEE').format(date)}, ${DateFormat('dd-mm-yyyy').format(date)}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),)),
          Expanded(child:GetUserName(DateFormat('EEEE').format(date),'class-1') ,),
          Expanded(child: GetUserName(DateFormat('EEEE').format(date),'class-2'),),
          Expanded(child:GetUserName(DateFormat('EEEE').format(date),'class-3'),),
          
          
        ]),
      ),
      
    );
  }
}
