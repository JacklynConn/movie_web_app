import 'dart:convert';
import 'package:flutter_web_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  final baseUrl = 'https://api.themoviedb.org/3/movie/';
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzEyNGJhMDE2YmExZTcyM2FkZDgyMzZhNjE0NTY0YSIsIm5iZiI6MTcyNTI5NjkwMy4yODgxMjYsInN1YiI6IjY1NTYzOGJkZDA1MWQ5MDEzYTE3MjFlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fGbrQzI0yh0nYsWGIoBeNGQW3L-HF_Qp7RbQmSs3z-c',
    'accept': 'application/json',
  };

  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await http.get(
      Uri.parse('${baseUrl}top_rated?language=en-US&page=1'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // debugPrint(response.body);
      return ((jsonDecode(response.body)['results']) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }

  Future<List<Movie>> fetchUpComingMovies() async {
    final response = await http.get(
      Uri.parse('${baseUrl}upcoming?language=en-US&page=1'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ((jsonDecode(response.body)['results']) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse('${baseUrl}now_playing?language=en-US&page=1'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ((jsonDecode(response.body)['results']) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('${baseUrl}popular?language=en-US&page=1'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ((jsonDecode(response.body)['results']) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('${baseUrl}search/movie?query=$query&include_adult=false&language=en-US&page=1'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ((jsonDecode(response.body)['results']) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }
}
