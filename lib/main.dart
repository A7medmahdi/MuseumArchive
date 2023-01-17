import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled1/Helper/color_utils.dart';
import 'package:untitled1/Helper/size_config.dart';
import 'package:untitled1/services/theme_services.dart';

import 'UI/Screeons/Categories/CategoriesScreen.dart';
import 'UI/Screeons/Categories/CategoryInput.dart';
import 'UI/Screeons/Categories/CategoryOpration.dart';
import 'UI/Screeons/Categories/UpdateCategory.dart';
import 'UI/Screeons/Categories/catgory_pieces.dart';
import 'UI/Screeons/Items/ImageScreen.dart';
import 'UI/Screeons/Items/InputScreen.dart';
import 'UI/Screeons/Items/UpdateScreen.dart';
import 'UI/Screeons/Items/detailsScreen.dart';
import 'UI/Screeons/SearchScreen.dart';
import 'UI/Screeons/SpecialItem.dart';
import 'UI/Widgets/MainDrawer.dart';
import 'UI/theme.dart';
import 'db/db_helper.dart';

void main() {

  runApp(const MyApp());
  DBHelper.initDatabase();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Museum Archive',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: const MyHomePage(title: "متحف الكفيل"),
      getPages: [
        GetPage(
            name: '/${CategoryPieces.routeName}',
            page: () => const CategoryPieces()),
        GetPage(
            name: '/${InputScreen.inputRouteName}',
            page: () => const InputScreen()),
        GetPage(
            name: '/${DetailsScreen.routeName}',
            page: () => const DetailsScreen()),
        GetPage(
            name: '/${ImageScreen.routeName}',
            page: () => const ImageScreen()),
        GetPage(
            name: '/${CategoryInput.routeName}',
            page: () => const CategoryInput()),
        GetPage(
            name: '/${CategoryUpdate.routeName}',
            page: () => const CategoryUpdate()),
        GetPage(
            name: '/${UpdateScreen.routeName}',
            page: () => const UpdateScreen()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  @override

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
              rippleColor: hexStringToColor("0A3A7A"),
              hoverColor: hexStringToColor("0A3A7A"),
              tabActiveBorder: Border.all(color: primaryClr, width: 1),
              gap: 8,
              color: Colors.grey[800],
              activeColor: hexStringToColor("0A3A7A"),
              iconSize: 24,
              tabBackgroundColor: Colors.white.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              tabBorderRadius: 0,
              onTabChange: (index) {
                setState(() {
                  this.index = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "الرئيسيية",
                ),
                GButton(
                  icon: Icons.insert_invitation_sharp,
                  text: "المجموعات",
                ),
                GButton(
                  icon: Icons.star,
                  text: "المميزة",
                ),
                GButton(
                  icon: Icons.search,
                  text: "بحث",
                )
              ])),
      body: getScreenRoute(index),
      drawer: const MainDrawer(),
    );
  }
}

 getScreenRoute(int index) {
  if (index == 0) {

    return const CategoriesScreen();
    // return Get.toNamed(CategoriesScreen.routeName);
  }
    if (index == 1) {
    return const CategoryOperation();
  } else if (index == 2) {
    return const SpecialItem();
  } else {
    return const SearchScreen();
  }
}
