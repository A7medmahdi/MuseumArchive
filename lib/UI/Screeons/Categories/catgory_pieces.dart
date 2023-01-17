import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:unicons/unicons.dart';
import 'package:untitled1/Controllers/ImageOprations.dart';
import 'package:untitled1/Helper/size_config.dart';
import 'package:untitled1/Models/item_Info.dart';
import 'package:untitled1/UI/Widgets/CreateSliverAppBar.dart';
import 'package:untitled1/UI/theme.dart';

import '../../../Controllers/detailsController.dart';
import '../../../Helper/color_utils.dart';
import '../../../services/Snackbars.dart';
import '../../Widgets/NoItemMessage.dart';
import '../AlretDialogs.dart';
import '../Items/InputScreen.dart';
import '../Items/UpdateScreen.dart';
import '../Items/detailsScreen.dart';

class CategoryPieces extends StatefulWidget {
  const CategoryPieces({Key? key}) : super(key: key);
  static const routeName = "CategoryPieces";

  @override
  State<CategoryPieces> createState() => _CategoryPiecesState();
}

class _CategoryPiecesState extends State<CategoryPieces> {
  final controllers = Get.put(DetailsController());
  final imageControllers = Get.put(ImagesOperation());
  final TextEditingController _museumNumberController = TextEditingController();
  final catId = int.parse(Get.arguments['catId'].toString());
  final catTitle = Get.arguments['title'].toString();
  List<ItemInfo> items = <ItemInfo>[].obs;

  get alertDialogs => null;

  @override
  void initState() {
    super.initState();
    controllers.getItems();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: hexStringToColor("fffafa"),
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createImageSilverAppBar("background3", 200),
            createSilverAppBar2()
          ];
        }, body: AnimationLimiter(child: Obx(() {
          controllers.getItems();
          if (_museumNumberController.text.isEmpty) {
            items = controllers.itemList
                .where((item) => item.category == catId)
                .toList();
          }

          if (controllers.itemList.isEmpty) {
            return const NoItemMsg();
          }
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: Slidable(
                                startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: ((context) {
                                          _deleteItem(item.id!);
                                        }),
                                        backgroundColor:
                                            hexStringToColor("A31118"),
                                        icon: Icons.delete,
                                        label: "حذف",
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        padding: const EdgeInsets.all(15),
                                        spacing: 15,
                                      )
                                    ]),
                                endActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: ((context) {
                                        _editItem(item);
                                      }),
                                      backgroundColor:
                                          hexStringToColor("F5E548"),
                                      icon: Icons.edit,
                                      label: "تعديل",
                                      autoClose: true,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      padding: const EdgeInsets.all(15),
                                      spacing: 15,
                                    )
                                  ],
                                ),
                                child: GFListTile(
                                    color: getColorByMode().withOpacity(0.5),
                                    subTitle: Text(
                                      item.museumNumber!,
                                      style: subHeadingStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      sendData(item.id!);
                                    },
                                    onLongPress: () {},
                                    title: Text(
                                      item.name!,
                                      style: headingStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    padding: const EdgeInsets.all(25),
                                    avatar: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(75),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.6),
                                                offset: const Offset(1.1, 1.1),
                                                blurRadius: 15.0),
                                          ],
                                        ),
                                        child: GFAvatar(
                                          radius: 75,
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.50),
                                          shape: GFAvatarShape.circle,
                                          // child: _showImage(item.id!),
                                          backgroundImage: _showImage(item.id!),
                                        )))))));
              });
        }))));
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
        expandedHeight: 10,
        actions: [
          Column(children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  " العدد ${items.length.toString()}",
                  style: subHeadingStyle.copyWith(fontSize: 12),
                  // textAlign: TextAlign.center,
                ))
          ]),
          IconButton(
            onPressed: () {
              selectCategory(catId.toString(), catTitle);
            },
            icon: Icon(
              UniconsLine.plus_circle,
              size: 35,
              color: Get.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ],
        backgroundColor: hexStringToColor("6082b6"),
        pinned: true,
        title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            child: CupertinoTextField(
                onChanged: (input) async {
                  //getCategoryByTitle
                  items = await controllers.getItemByMuseumNumber(input);
                },
                controller: _museumNumberController,
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

  _showImage(int index) {
    File fileImage = File("${imageControllers.getFileImage(index)}/1.png");
    return FileImage(fileImage);
  }

  void sendData(int itemID) {
    Get.toNamed('/${DetailsScreen.routeName}', arguments: {
      'itemID': itemID,
    });
  }

  void selectCategory(String catId, String catTitle) {
    Get.toNamed('/${InputScreen.inputRouteName}', arguments: {
      'catId': catId,
      'title': catTitle,
    });
  }

  void _editItem(ItemInfo item) {
    Get.toNamed('/${UpdateScreen.routeName}', arguments: {
      'itemId': item.id,
      'title': catTitle,
    });
  }

  void _deleteItem(int id) async {
    var result = await alertDialogs.yesNoDialog(
        context, "حذف معلومات", "هل تريد تأكيد على حذف ؟");
    if (result == DialogsAction.yes) {
      controllers.delete(id);
      SnackBars().snackBarSuccess("تم الحذف بنجاح", "");
      _deleteImage(id);
      // GFToastShow().showSuccess('تم الحذف بنجاح', context);
    }
  }

  _deleteImage(int? id) async {
    try {
      final path = Directory('/storage/emulated/0/Al-Kafeel Museum/$id/');
      if (await path.exists()) {
        List<FileSystemEntity> filesEntity = path.listSync();
        for (FileSystemEntity fileEntity in filesEntity) {
          File fileToDelete = File(fileEntity.path);
          fileToDelete.delete(recursive: true);
        }
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
