import 'package:flutter/material.dart';
import 'package:flutter_web_app/home_widgets/custom_carousel_slider.dart';
import 'package:flutter_web_app/models/movie_model.dart';
import 'package:flutter_web_app/services/movie_services.dart';
import 'package:flutter_web_app/widgets/skeleton/carousel_skeleton.dart';
import 'package:flutter_web_app/widgets/drawer.dart';
import 'package:flutter_web_app/widgets/navbar.dart';
import 'package:flutter_web_app/widgets/skeleton/footer.dart';
import 'package:flutter_web_app/widgets/skeleton/now_playing_skeleton.dart';
import 'package:flutter_web_app/widgets/skeleton/popular_movies_skeleton.dart';

import 'home_widgets/now_playing_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> topRatedMovies = [];
  List<Movie> nowPlayingMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    topRatedMovies = await MovieServices().fetchTopRatedMovies();
    nowPlayingMovies = await MovieServices().fetchNowPlayingMovies();
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: isLoading
                        ? const CarouselSkeleton()
                        : CustomCarouselSlider(topRatedMovies: topRatedMovies),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 2,
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
                            : NowPlayingList(nowPlayingMovies: nowPlayingMovies),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double gridHeight = (constraints.maxWidth / 4) * 1.4 * 3;
                  return SizedBox(
                    height: gridHeight,
                    child: const PopularMoviesSkeleton(),
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
