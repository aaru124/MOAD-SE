import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/past_papers/main.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

class PastPaper extends StatelessWidget {
  final String user;
  final String class_yr;
  final int len;

  PastPaper({required this.user,required this.class_yr,required this.len});
  final imageList = [
    
  ];
  
  @override
  Widget build(BuildContext context) {
    for(int i=1;i<len+1;i++){
      imageList.add('assets/images/$class_yr/$i.png');
    }
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromARGB(221, 15, 14, 14)),
      home: Scaffold(
        appBar:AppBar(
          
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: () => Navigator.push(
                   context, MaterialPageRoute(builder: (context) => PastPaperMain(user: user,)),)
          
        ),
        backgroundColor: Colors.white,),
        backgroundColor: Color(0xFFF3F2F2),
        body: Swiper(
          scrollDirection: Axis.horizontal,
          pagination: const SwiperPagination(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.only(bottom: 10),
    builder: FractionPaginationBuilder(
      activeFontSize: 16,
      fontSize: 12,
      activeColor: Color.fromARGB(255, 13, 12, 12), // set active color here
      color: Color.fromARGB(255, 12, 11, 11), // set inactive color here
    ),
          ),
          control: SwiperControl(color: Colors.black),
          autoplayDisableOnInteraction: true,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
            ),
            );
          },
        ),
      ),
    );
  }
}