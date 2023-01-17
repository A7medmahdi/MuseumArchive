import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/ImageOprations.dart';

class GetImageById extends StatelessWidget {
  GetImageById({Key? key, required this.index, required this.borderRadius}) : super(key: key);
  final int index;
  final double borderRadius;
  final imageControllers = Get.put(ImagesOperation());

  @override
  Widget build(BuildContext context) {
    File fileImage = File("${imageControllers.getFileImage(index)}/1.png");
    if (fileImage.existsSync()) {
      return ClipRRect(
           borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox.fromSize(
              size:  Size.fromRadius(borderRadius),
              child: Image.file(fileImage, fit: BoxFit.cover)));
    } else {
      return Image.asset("assets/Images/Empty.jpg");
    }
  }
}
