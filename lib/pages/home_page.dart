import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/home_widgets/custom_carousel_slider.dart';
import 'package:flutter_web_app/models/movie_model.dart';
import 'package:flutter_web_app/services/movie_services.dart';
import 'package:flutter_web_app/widgets/skeleton/carousel_skeleton.dart';
import 'package:flutter_web_app/widgets/drawer.dart';
import 'package:flutter_web_app/widgets/navbar.dart';
import 'package:flutter_web_app/widgets/skeleton/footer.dart';
import 'package:flutter_web_app/widgets/skeleton/now_playing_skeleton.dart';
import 'package:flutter_web_app/widgets/skeleton/popular_movies_skeleton.dart';
import '../widgets/home_widgets/now_playing_list.dart';
import '../widgets/home_widgets/popular_movies_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> topRatedMovies = [];
  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE2B616),
                ),
              ),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: isLoading
                          ? const CarouselSkeleton()
                          : CustomCarouselSlider(
                              topRatedMovies: topRatedMovies),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Now Playing',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE2B616),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 470,
                          child: isLoading
                              ? const NowPlayingSkeleton()
                              : NowPlayingList(
                                  nowPlayingMovies: nowPlayingMovies),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Explore Popular Movies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE2B616),
                ),
              ),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: isLoading
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        double gridHeight =
                            (constraints.maxWidth / 5) * 1.25 * 3;
                        return SizedBox(
                          height: gridHeight,
                          child: isLoading
                              ? const PopularMoviesSkeleton()
                              : PopularMoviesView(popularMovies: popularMovies),
                        );
                      },
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        double gridHeight = (constraints.maxWidth / 5) *
                            1.25 *
                            (popularMovies.length / 5);
                        return SizedBox(
                          height: gridHeight,
                          child: isLoading
                              ? const PopularMoviesSkeleton()
                              : PopularMoviesView(popularMovies: popularMovies),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 8),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
