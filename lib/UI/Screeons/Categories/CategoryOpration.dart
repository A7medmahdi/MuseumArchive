import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled1/UI/theme.dart';

import '../../../Controllers/CategoryController.dart';
import '../../../Data/dummy_data.dart';
import '../../../Helper/color_utils.dart';
import '../../../Models/Category.dart';
import '../../Widgets/CategoryCard.dart';
import '../../Widgets/CreateSliverAppBar.dart';
import '../../Widgets/NoItemMessage.dart';
import 'CategoryInput.dart';

class CategoryOperation extends StatefulWidget {
  const CategoryOperation({Key? key}) : super(key: key);

  @override
  State<CategoryOperation> createState() => _CategoryOperationState();
}

class _CategoryOperationState extends State<CategoryOperation> {
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    // _categoryController.getCategory();
    List<Category> catList = DUMMY_CATEGORIES;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  CategoryInput
          Get.toNamed('/${CategoryInput.routeName}', arguments: {
            'catId': null,
            'title': null,
            'color': null,
          });
        },
        backgroundColor: getColorByMode(),
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
        return <Widget>[
          createImageSilverAppBar("background4InputScreen2", 50),
          createSearchSilverAppBar(),
        ];
      }, body: Obx(() {
        _categoryController.getCategory();
        RxList<Category> catList = _categoryController.categoryList;
        if (catList.isEmpty) {
          return const NoItemMsg();
        } else {
          return ListView.builder(
              itemCount: catList.length,
              itemBuilder: (BuildContext context, int index) {
                var category = catList[index];
                return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                        verticalOffset: 500.0,
                        child: FadeInAnimation(
                            child: CategoryCard(
                          catId: category.id!,
                          color: hexStringToColor(category.color!),
                          catName: category.title!,
                        ))));
              });
        }
      })),
    );
  }
}
