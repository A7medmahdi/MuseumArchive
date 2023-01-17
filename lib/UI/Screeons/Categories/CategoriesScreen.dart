
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:unicons/unicons.dart';
import 'package:untitled1/Models/Category.dart';
import 'package:untitled1/UI/Widgets/NoItemMessage.dart';


import '../../../Controllers/CategoryController.dart';
import '../../../Helper/color_utils.dart';
import '../../../db/db_helper.dart';
import '../../Widgets/CategoryCard.dart';
import '../../Widgets/CategoryWidget.dart';
import '../../Widgets/CreateSliverAppBar.dart';
import '../../theme.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static String routeName = "CategoriesScreen";
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryController controllers = Get.put(CategoryController());
  final TextEditingController _categoryController = TextEditingController();
  List<Category> catList = <Category>[].obs;

  @override
  void initState() {
    super.initState();
    // DBHelper.initDatabase();
     controllers.getCategory();

  }



  @override
  Widget build(BuildContext context) {
    catList = controllers.categoryList;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
      return <Widget>[
        createImageSilverAppBar("background3", 200),
        createSilverAppBar2(),
      ];
    },
  body: Obx(() {
    // controllers.getCategory();
      debugPrint(controllers.categoryList.length.toString());
      if (_categoryController.text.isEmpty) {
        catList = controllers.categoryList;
      }
      if (catList.isEmpty) {
        return const NoItemMsg();
      } else {
        return
          // ListView.builder(
          //     itemCount: catList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       var category = catList[index];
          //       return AnimationConfiguration.staggeredList(
          //           position: index,
          //           duration: const Duration(milliseconds: 375),
          //           child: SlideAnimation(
          //               verticalOffset: 500.0,
          //               child: FadeInAnimation(
          //                   child: CategoryCard(
          //                     catId: category.id!,
          //                     color: hexStringToColor(category.color!),
          //                     catName: category.title!,
          //                   ))));
          //     });

          GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 28 / 22,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          children: catList
              .map((catItem) => CategoryItem(
                    id: catItem.id!,
                    title: catItem.title!,
                    color: catItem.color!,
                  ))
              .toList(),
        );
      }
    })));
  }

  /*
  * //getCategoryByTitle
  * items = await controllers.getItemByMuseumNumber(input);
  */
  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
        expandedHeight: 10,
        backgroundColor: hexStringToColor("6082b6"),
        pinned: true,
        title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            child: CupertinoTextField(
                onChanged: (String input) async {
                  catList = await controllers.getCategoryByTitle(input);
                },
                controller: _categoryController,
                keyboardType: TextInputType.text,
                placeholder: 'بحث',
                placeholderStyle: const TextStyle(
                  color: Color(0xffC4C6CC),
                  fontSize: 14.0,
                  fontFamily: 'Brutal',
                ),
                prefix: const Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                  child: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ))));
  }
}
