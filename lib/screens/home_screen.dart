import 'package:books_and_details/screens/books.dart';
import 'package:books_and_details/screens/favourites.dart';
import 'package:books_and_details/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: const TabBarView(children: [Books(), Favourites(), Profile()]),
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.menu_book_rounded),
            TabItem(icon: Icons.favorite),
            TabItem(icon: Icons.account_circle),
          ],
          backgroundColor: color.primary,
        ),
      ),
    );
  }
}
