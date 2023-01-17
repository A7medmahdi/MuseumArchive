import 'package:flutter/material.dart';
import 'package:untitled1/UI/theme.dart';

import '../Widgets/CreateSliverAppBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding:const EdgeInsets.only(top: 50),
          child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[createImageSilverAppBar("Quick Search",70)];


          },

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "123456",
              style: headingStyle,
              textAlign: TextAlign.center,
            )]),),
        ));
  }
}
