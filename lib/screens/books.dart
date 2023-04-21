import 'package:books_and_details/color_scheme.dart/custom_color.g.dart';
import 'package:books_and_details/screens/search.dart';
import 'package:books_and_details/services/database.dart';
import 'package:books_and_details/shared_preferences.dart';
import 'package:books_and_details/widgets/book_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final db = FireStore();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        centerTitle: true,
        title: Text('All Books', style: TextStyle(color: color.background)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Search());
              },
              icon: Icon(Icons.search, color: color.background)),
          PopupMenuButton(
            color: color.background,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            itemBuilder: ((context) {
              return [
                PopupMenuItem(
                  child: SubmenuButton(
                    trailingIcon: const Icon(Icons.sort),
                    menuChildren: [
                      ExpansionTile(
                        title: const Text('Name     '),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descending = false;
                                      orderBy = 'title';
                                      setDescending(descending);
                                      setOrderBy(orderBy);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Asc ⬆')),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descending = true;
                                      orderBy = 'title';
                                      setDescending(descending);
                                      setOrderBy(orderBy);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Desc ⬇'))
                            ],
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Time     '),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descending = false;
                                      orderBy = 'modifiedAt';
                                      setDescending(descending);
                                      setOrderBy(orderBy);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Asc. ⬆')),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descending = true;
                                      orderBy = 'modifiedAt';
                                      setDescending(descending);
                                      setOrderBy(orderBy);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Desc. ⬇')),
                            ],
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Author     '),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descending = false;
                                      orderBy = 'author';
                                      setDescending(descending);
                                      setOrderBy(orderBy);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Asc. ⬆')),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      descending = true;
                                      orderBy = 'author';
                                      setDescending(descending);
                                      setOrderBy(orderBy);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Desc. ⬇')),
                            ],
                          ),
                        ],
                      )
                    ],
                    child: const Text('Sort by:', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ];
            }),
            icon: const Icon(Icons.more_vert),
            tooltip: 'Options',
          ),
        ],
      ),
      body: StreamBuilder<List>(
          stream: db.readBooks(descending: descending, orderBy: orderBy),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              final booksData = snapshot.data!;
              allBooks = booksData as List<Map<String, dynamic>>;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ListView.builder(
                  itemCount: booksData.length,
                  itemBuilder: (context, index) {
                    final data = allBooks[index];
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
                          'Loading Books',
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
      // floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
