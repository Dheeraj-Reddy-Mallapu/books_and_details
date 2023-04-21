import 'package:books_and_details/services/database.dart';
import 'package:books_and_details/widgets/book_list_tile.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FireStore();
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        centerTitle: true,
        title: Text('Favourites', style: TextStyle(color: color.background)),
      ),
      body: StreamBuilder<List>(
          stream: db.readBooks(descending: true, orderBy: 'title'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              final booksData = snapshot.data!;
              allBooks = booksData as List<Map<String, dynamic>>;
              List<Map<String, dynamic>> favouriteBooks = [];
              favouriteBooks = allBooks.where((element) => element['favourites'].contains(user.uid)).toList();
              if (favouriteBooks.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ListView.builder(
                    itemCount: favouriteBooks.length,
                    itemBuilder: (context, index) {
                      final data = favouriteBooks[index];
                      return BookListTile(data: data);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('Long press on a book to start adding favourites'),
                );
              }
            } else {
              return Center(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: color.tertiary,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Loading your favourite books',
                          style: TextStyle(color: color.background, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CircularProgressIndicator(color: color.background),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
