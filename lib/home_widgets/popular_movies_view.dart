import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class PopularMoviesView extends StatefulWidget {
  final List<Movie> popularMovies;

  const PopularMoviesView({super.key, required this.popularMovies});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  int? hoverIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.popularMovies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final movie = widget.popularMovies[index];
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              hoverIndex = index;
            });
          },
          onExit: (_) {
            setState(() {
              hoverIndex = null;
            });
          },
          onHover: (_) {
            setState(() {
              hoverIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform: hoverIndex == index
                ? (Matrix4.identity()
                  ..scale(1.05, 1.05)
                  ..translate(0, -10))
                : Matrix4.identity(),
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/movie/${movie.id}');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: hoverIndex == index ? 20 : 4,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListView(
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  color: Color(0xFFE2B616),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  const SizedBox(width: 5),
                                  Text(movie.voteAverage.toString())
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Language: ${movie.originalLanguage}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Adult: ${movie.adult ? 'Yes' : 'No'}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
