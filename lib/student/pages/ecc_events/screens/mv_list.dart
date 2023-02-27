/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/ecc/main.dart';

import '../../../student_main.dart';
import '../models/movie1.dart';
import 'movie_details.dart';

class MovieListScreen extends StatelessWidget {
  final String user;
  final int total;
  MovieListScreen({required this.user,required this.total});
  @override
  Widget build(BuildContext context) {
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
                title: Text(movie.title),
                subtitle: Text(movie.year.toString()),
                leading: Image.network(movie.imageUrl),
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
}*/
