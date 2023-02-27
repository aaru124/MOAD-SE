import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../student_main.dart';
import '../screens/movie_details.dart';

class Movie extends StatefulWidget {
   String user;
   int total;
  int srno;
  String title;
  
  String imageUrl;
  String year;
  int ecc;
  bool button;

   Movie({super.key,required this.title,
      
      required this.imageUrl,
      required this.year,
      required this.ecc,
      required this.button,
      required this.user,
      required this.total,
      required this.srno});

  @override
  State<Movie> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Movie> {
  late String user;
  late int total;
  void initState() {
    user=widget.user;
    total=widget.total;
    super.initState();
    getData().then((data) {
      setState(() {
        _data = data;
      });
    });
    
   
  }
  late List<Movie> movieList=[];
  void makeMovieItem() {
  if (_data!=null){
    for(int i=0;i<_data.length;i++){
      Map<String,dynamic> data = _data[i].data() as Map<String, dynamic>;
      Movie a= Movie(title: "${data['title']}", imageUrl: "${data['img']}", year: "${data['year']}", ecc: data['ecc'], button: data['disabled'], user: user,total: total,srno: data['srno'],);
      movieList.add(a);
    }
    
  }
  
}
late List<DocumentSnapshot> _data=[];

Future<List<DocumentSnapshot>> getData() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('events').get();
  return querySnapshot.docs;
}



  @override
  Widget build(BuildContext context) {
    makeMovieItem();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: () => Navigator.push(
                   context, MaterialPageRoute(builder: (context) => HomePage(user:user)))
          
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            Movie movie = movieList[index];
            return Card(
              
              child: ListTile(
                horizontalTitleGap: 20,
                
                title: Text(movie.title),
                subtitle: Text(movie.year.toString()),
                leading: Image.asset(movie.imageUrl),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(user:user,movie:movie,total:total)));
                },
              ),
            );
          }),
    );
  }
}