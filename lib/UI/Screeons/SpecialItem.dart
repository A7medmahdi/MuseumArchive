import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';

import '../../Controllers/ImageOprations.dart';
import '../../Controllers/detailsController.dart';
import '../../Helper/color_utils.dart';
import '../../Helper/size_config.dart';
import '../../Models/item_Info.dart';
import '../Widgets/CreateSliverAppBar.dart';
import '../Widgets/NoItemMessage.dart';
import '../theme.dart';
import 'Items/detailsScreen.dart';

class SpecialItem extends StatefulWidget {
  const SpecialItem({Key? key}) : super(key: key);

  @override
  State<SpecialItem> createState() => _SpecialItemState();
}

class _SpecialItemState extends State<SpecialItem> {
  final controllers = Get.put(DetailsController());
  final imageControllers = Get.put(ImagesOperation());
  List<ItemInfo> items = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: NestedScrollView(headerSliverBuilder:
                (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[createImageSilverAppBar("Rare pieces", 70)];
            }, body: AnimationLimiter(
              child: Obx(() {
                controllers.getItems();
                items = controllers.itemList
                    .where((item) => item.special == 1)
                    .toList();
                if (items.isEmpty) {
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
                                      _deleteItem(item.id);
                                    }),
                                    backgroundColor: hexStringToColor("A31118"),
                                    icon: Icons.delete,
                                    label: "حذف",
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    padding: const EdgeInsets.all(15),
                                    spacing: 15,
                                  )
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: ((context) {
                                      _editItem(item);
                                    }),
                                    backgroundColor: hexStringToColor("F5E548"),
                                    icon: Icons.edit,
                                    label: "تعديل",
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    padding: const EdgeInsets.all(15),
                                    spacing: 15,
                                  )
                                ],
                              ),
                              child: GFListTile(
                                  color: Get.isDarkMode
                                      ? hexStringToColor("25465F")
                                          .withOpacity(0.5)
                                      : hexStringToColor("9BB7D4")
                                          .withOpacity(0.5),
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
                                        borderRadius: BorderRadius.circular(75),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.6),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 15.0),
                                        ],
                                      ),
                                      child: GFAvatar(
                                        radius: 75,
                                        // size: 0,
                                        backgroundColor: Colors.transparent
                                            .withOpacity(0.50),
                                        shape: GFAvatarShape.circle,
                                        backgroundImage: _showImage(item.id!),
                                      ))),
                            ),
                          ),
                        ),
                      );
                    });
              }),
            ))));
  }

  void _editItem(ItemInfo item) {}

  void _deleteItem(int? id) {}

  Image showImage(int index) {
    var path = imageControllers.getFileImage(index);
    return Image.file(
      File(path),
      width: 45,
      height: 45,
    );
  }

  FileImage _showImage(int index) {
    File fileImage = File("${imageControllers.getFileImage(index)}/1.png");
    return FileImage(fileImage);
  }

  void sendData(int itemID) {
    Get.toNamed('/${DetailsScreen.routeName}', arguments: {
      'itemID': itemID,
    });
  }
}


