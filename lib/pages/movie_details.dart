import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/drawer.dart';
import 'package:flutter_web_app/widgets/navbar.dart';

import '../home_widgets/popular_movies_view.dart';
import '../models/movie_model.dart';
import '../services/movie_services.dart';
import '../widgets/skeleton/footer.dart';
import '../widgets/skeleton/popular_movies_skeleton.dart';

class MovieDetails extends StatefulWidget {
  final String movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<Movie> similarMovies = [];
  late Movie movieDetails;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    similarMovies = await MovieServices().fetchSimilarMovies(widget.movieId);
    movieDetails = await MovieServices().fetchMovieById(widget.movieId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNavbar(),
      drawer: const CustomDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (movieDetails != null)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2000,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 400,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        'https://image.tmdb.org/t/p/original${movieDetails.backdropPath}',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Colors.black,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 300,
                              left: 20,
                              right: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w200${movieDetails.posterPath}',
                                          width: 150,
                                          // height: 200,
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                movieDetails.originalTitle,
                                                style: const TextStyle(
                                                  color: Color(0xFFE2B616),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                  'Release Date: ${movieDetails.releaseDate}'),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    'Vote Count: ${movieDetails.voteCount}',
                                                  ),
                                                  const SizedBox(width: 10),
                                                  const Icon(
                                                    Icons.trending_up,
                                                    color: Colors.orange,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      'Popularity: ${movieDetails.popularity}',
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                movieDetails.overview,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Original Language: ${movieDetails.originalLanguage}',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Adult: ${movieDetails.adult ? 'Yes' : 'No'}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 25,
                                    ),
                                    child: Text(
                                      'Similar Movies',
                                      style: TextStyle(
                                        color: Color(0xFFE2B616),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  isLoading
                                      ? LayoutBuilder(
                                          builder: (context, constraints) {
                                            double gridHeight =
                                                (constraints.maxWidth / 5) *
                                                    1.25 *
                                                    3;
                                            return SizedBox(
                                              height: gridHeight,
                                              child:
                                                  const PopularMoviesSkeleton(),
                                            );
                                          },
                                        )
                                      : LayoutBuilder(
                                          builder: (context, constraints) {
                                            double gridHeight =
                                                (constraints.maxWidth / 5) *
                                                    1.25 *
                                                    (similarMovies.length / 5);
                                            return SizedBox(
                                              height: gridHeight,
                                              child: PopularMoviesView(
                                                popularMovies: similarMovies,
                                              ),
                                            );
                                          },
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Footer(),
                    ],
                  ),
                )
              : const Center(
                  child: Text('No Data'),
                ),
    );
  }
}
