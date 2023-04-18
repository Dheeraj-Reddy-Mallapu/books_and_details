import 'dart:math';

import 'package:books_and_details/color_scheme.dart/custom_color.g.dart';
import 'package:books_and_details/services/database.dart';
import 'package:books_and_details/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksAnsDetails extends StatelessWidget {
  const BooksAnsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final customColor = Theme.of(context).extension<CustomColors>()!;

    List<Color> colors = [
      customColor.blueContainer!,
      customColor.pinkContainer!,
      customColor.purpleContainer!,
      customColor.redContainer!,
      customColor.yellowContainer!,
      customColor.orangeContainer!,
    ];
    List<Color> colorPrimaries = [
      customColor.blue!,
      customColor.pink!,
      customColor.purple!,
      customColor.red!,
      customColor.yellow!,
      customColor.orange!,
    ];

    final db = FireStore();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        centerTitle: true,
        title: Text('Books and Details', style: TextStyle(color: color.background)),
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
                    final colorIndex = Random().nextInt(colors.length);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 1,
                              color: colorPrimaries[colorIndex],
                            )
                          ],
                          color: colors[colorIndex],
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 1,
                                    color: colorPrimaries[colorIndex],
                                  )
                                ],
                                color: color.background,
                              ),
                              child: SvgPicture.asset('assets/logo.svg', height: 20),
                            ),
                          ),
                          Text(data['title'], style: TextStyle(color: colorPrimaries[colorIndex])),
                        ]),
                      ),
                    );
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
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
