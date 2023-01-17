import 'package:flutter/material.dart';

import '../theme.dart';

class TextContainer extends StatelessWidget {
  final String text;
  const TextContainer({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text,
        style: HeadingStyle.copyWith(fontSize: 13),
        textAlign: TextAlign.center,
      ),
    );
  }
}