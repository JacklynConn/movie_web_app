import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/skeleton/carousel_skeleton.dart';
import 'package:flutter_web_app/widgets/drawer.dart';
import 'package:flutter_web_app/widgets/navbar.dart';
import 'package:flutter_web_app/widgets/skeleton/now_playing_skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomNavbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
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
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: CarouselSkeleton(),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Now Playing',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE2B616),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      NowPlayingSkeleton(),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
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
          ],
        ),
      ),
    );
  }
}
