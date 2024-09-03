import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFE2B616),
            ),
            child: const Text(
              'TMDB',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        // fontStyle: FontStyle.italic,
                      ),
                      onSubmitted: (value) {
                        context.go('/search_page');
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.cancel, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
