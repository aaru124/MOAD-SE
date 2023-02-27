import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  String title;
  String description;
  String imageUrl;
  String year;
  int ecc;
  bool button;

  Movie(
      {
        required this.title,
      required this.description,
      required this.imageUrl,
      required this.year,
      required this.ecc,
      required this.button});
}



void makeMovieItem() async{
  getData().then((data) => _data=data);
  
}
late List<DocumentSnapshot> _data;
Future<List<DocumentSnapshot>> getData() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('attended-event').get();
  return querySnapshot.docs;
}



List<Movie> movieList = [
  Movie(
      title: 'Queering Yourself, Decolonizing the Community',
      description: 'Lorem Ipsum',
      year: '4th Feb',
      imageUrl: 'assets/index.jpeg',
      ecc:2,
      button:false),
  Movie(
      title: 'Queering Yourself, Decolonizing the Community',
      description: 'Lorem Ipsum',
      year: '4th Feb',
      imageUrl: 'assets/index.jpeg',
      ecc:2,
      button:true),
  Movie(
      title: 'Queering Yourself, Decolonizing the Community',
      description: 'Lorem Ipsum',
      year: '4th Feb',
      imageUrl: 'assets/index.jpeg',
      ecc:2,button:true),
];
