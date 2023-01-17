import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:untitled1/UI/theme.dart';

import '../../Controllers/ImageOprations.dart';
import '../../Helper/color_utils.dart';
import '../Screeons/Categories/catgory_pieces.dart';
import '../Screeons/Items/detailsScreen.dart';

class ItemWidget extends StatelessWidget {
  final int? id;
  final String museumNumber;
  final String name;
  final String details;
  final String category;

  // final Color color;

  // ignore: use_key_in_widget_constructors
  ItemWidget({
    required this.id,
    required this.museumNumber,
    required this.name,
    required this.details,
    required this.category,
    // required this.color,
  });

  final imageControllers = Get.put(ImagesOperation());

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
                gradient: RadialGradient(
                  colors: [
                    hexStringToColor("3F48CC").withOpacity(0.1),
                    hexStringToColor("3F48CC").withOpacity(0.5)
                  ],
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              Text(
                name,
                style: headingStyle,
              ),
              Text(
                museumNumber,
                style: subHeadingStyle,
                textAlign: TextAlign.justify,
              ),
              Expanded(
                  child: GFAvatar(
                backgroundColor: Colors.transparent.withOpacity(0.1),
                child: _showImage(id!),
                size: 450,
              ))
            ])));
  }

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryPieces.routeName, arguments: {
      'catId': id,
    });
  }

  _showImage(int index) {
    var path = imageControllers.getFileImage(index);
    return Image.file(
      File(path),
      scale: 1.5,
    );
  }
  void sendData() {
    Get.toNamed('/${DetailsScreen.routeName}', arguments: {
      'catId': id,
    });
  }
}
