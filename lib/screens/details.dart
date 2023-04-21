import 'package:books_and_details/color_scheme.dart/custom_color.g.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors[0],
              ),
              child: Column(
                children: [
                  Text('Title: ',
                      style: TextStyle(
                        color: colorPrimaries[0],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text(data['title']),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors[1],
              ),
              child: Column(
                children: [
                  Text('Author: ',
                      style: TextStyle(
                        color: colorPrimaries[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text(data['author']),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors[3],
              ),
              child: Column(
                children: [
                  Text('Publisher: ',
                      style: TextStyle(
                        color: colorPrimaries[3],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text(data['publisher']),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors[3],
              ),
              child: Column(
                children: [
                  Text('Publishing Date: ',
                      style: TextStyle(
                        color: colorPrimaries[3],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text(data['publishingDate']),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors[2],
              ),
              child: Column(
                children: [
                  Text('Number of pages: ',
                      style: TextStyle(
                        color: colorPrimaries[2],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text(data['noOfPages'].toString()),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors[4],
              ),
              child: Column(
                children: [
                  Text('Description: ',
                      style: TextStyle(
                        color: colorPrimaries[4],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data['description'].toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
