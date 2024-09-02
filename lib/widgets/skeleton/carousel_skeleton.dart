import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSkeleton extends StatelessWidget {
  const CarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CarouselSlider(
        items: List.generate(
          5,
          (index) => Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        options: CarouselOptions(
          height: 500,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayInterval: const Duration(seconds: 3),
          enableInfiniteScroll: true,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
