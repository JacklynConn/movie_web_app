import 'package:flutter/material.dart';
import 'package:flutter_web_app/home_page.dart';
import 'package:flutter_web_app/movies_page.dart';
import 'package:flutter_web_app/search.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/movies_page', builder: (context, state) => const MoviesPage()),
      GoRoute(path: '/search_page', builder: (context, state) => const SearchPage()),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TMDB Movie App',
      theme: ThemeData.dark(),
      routerConfig: _router,
    );
  }
}
