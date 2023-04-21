import 'package:books_and_details/services/database.dart';
import 'package:books_and_details/widgets/book_list_tile.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchInput = TextEditingController();
  String searchInputText = '';
  @override
  Widget build(BuildContext context) {
    final db = FireStore();
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        centerTitle: true,
        title: TextFormField(
          controller: searchInput,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: color.background),
          ),
          onChanged: (value) {
            setState(() {
              searchInputText = value;
            });
          },
        ),
      ),
      body: StreamBuilder<List>(
          stream: db.readBooks(descending: true, orderBy: 'title'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              final booksData = snapshot.data!;
              allBooks = booksData as List<Map<String, dynamic>>;
              List<Map<String, dynamic>> searchedBooks = [];

              if (searchInput.text.isEmpty) {
                searchedBooks = allBooks;
              } else {
                searchedBooks = allBooks.where((element) => element['title'].contains(searchInputText)).toList();
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ListView.builder(
                  itemCount: searchedBooks.length,
                  itemBuilder: (context, index) {
                    final data = searchedBooks[index];
                    return BookListTile(data: data);
                  },
                ),
              );
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
