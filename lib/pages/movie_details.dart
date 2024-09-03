import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/drawer.dart';
import 'package:flutter_web_app/widgets/navbar.dart';

class MovieDetails extends StatefulWidget {
  final String movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Movie Details Page'),
      ),
    );
  }
}
