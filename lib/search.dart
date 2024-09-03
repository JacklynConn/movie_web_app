import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Page',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE2B616),
        ),
      ),
    );
  }
}
