import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class PopularMoviesView extends StatefulWidget {
  final List<Movie> popularMovies;

  const PopularMoviesView({super.key, required this.popularMovies});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.popularMovies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final movie = widget.popularMovies[index];
        return MouseRegion(
          onEnter: (_) {
            setState(() {

            });
          },
          onExit: (_) {
            setState(() {

            });
          },
          onHover: (_) {
            setState(() {

            });
          },
          child: AnimatedContainer(duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
