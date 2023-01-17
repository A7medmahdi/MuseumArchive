import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Helper/color_utils.dart';

import '../Screeons/Categories/catgory_pieces.dart';
import 'GetImageById.dart';
import 'TextContainer.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String title;
  final String color;

  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        onTap: () {
          sendData();
        },
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: hexStringToColor(color),
                    offset: const Offset(1, .5),
                    blurRadius: 10.0,
                  )
                ],
                color: hexStringToColor(color),
                borderRadius: BorderRadius.circular(15)),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Get.isDarkMode
                        ? hexStringToColor(color)
                        : Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextContainer(text: id.toString()),
                      TextContainer(text: title),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor:
                            hexStringToColor(color).withOpacity(0.5),
                        child: GetImageById(
                          index: id,
                          borderRadius: 32,
                        ),
                      ),
                    ]))));
  }

  void sendData() {
    Get.toNamed('/${CategoryPieces.routeName}', arguments: {
      'catId': id,
      'title': title,
    });
  }
}
