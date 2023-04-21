import 'dart:math';

import 'package:books_and_details/color_scheme.dart/custom_color.g.dart';
import 'package:books_and_details/screens/details.dart';
import 'package:books_and_details/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({super.key, required this.data});
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
    String favBtnText = 'Add to favourites';
    List allFavUsers = [];
    allFavUsers = data['favourites'];
    if (!allFavUsers.contains(user.uid)) {
      favBtnText = 'Add to favourites';
    } else {
      favBtnText = 'Remove from favourites';
    }
    final colorIndex = Random().nextInt(colors.length);
    return InkWell(
      child: Padding(
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
                  color: Colors.white,
                ),
                child: SvgPicture.asset('assets/logo.svg', height: 20),
              ),
            ),
            Text(data['title'], style: TextStyle(color: colorPrimaries[colorIndex])),
          ]),
        ),
      ),
      onTap: () => Get.to(() => Details(data: data)),
      onLongPress: () {
        // add to favourites
        Get.defaultDialog(
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  if (!allFavUsers.contains(user.uid)) {
                    allFavUsers.add(user.uid);
                    db.collection('allBooks').doc(data['bookId']).update({'favourites': allFavUsers});
                  } else {
                    allFavUsers.remove(user.uid);
                    db.collection('allBooks').doc(data['bookId']).update({'favourites': allFavUsers});
                  }
                  Get.back();
                },
                child: Text(favBtnText)),
          ],
          title: data['title'],
          content: const Text(''),
        );
      },
    );
  }
}
