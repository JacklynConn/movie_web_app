import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '© 2024 MovieTMDB. All rights reserved.',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.facebook,
                  color: Colors.grey[400],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.link,
                ),
                color: Colors.grey[400],
                tooltip: 'Twitter',
              ),
              Text(
                'Made with ❤️ by Flutter Devs',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
