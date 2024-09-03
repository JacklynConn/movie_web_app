import 'package:flutter/material.dart';
import 'package:flutter_web_app/services/movie_services.dart';
import 'package:flutter_web_app/widgets/drawer.dart';
import 'package:flutter_web_app/widgets/navbar.dart';

import 'models/movie_model.dart';
import 'movies_widget/movies_filter.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> topRatedMovies = [];
  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    MovieServices movieServices = MovieServices();
    topRatedMovies = await movieServices.fetchTopRatedMovies();
    nowPlayingMovies = await movieServices.fetchNowPlayingMovies();
    popularMovies = await movieServices.fetchPopularMovies();
    upcomingMovies = await movieServices.fetchUpComingMovies();
    setState(() {
      isLoading = false;
    });
    // debugPrint(topRatedMovies[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomNavbar(),
      body: MoviesFilter(
        topRatedMovies: topRatedMovies,
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        upcomingMovies: upcomingMovies,
      ),
    );
  }
}
