import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:photo_view/photo_view.dart';
import 'package:untitled1/Models/item_Info.dart';
import 'package:untitled1/UI/theme.dart';

import '../../../Controllers/ImageOprations.dart';
import '../../../Controllers/detailsController.dart';
import '../../../Helper/color_utils.dart';
import '../AlretDialogs.dart';
import '../Categories/catgory_pieces.dart';
import 'UpdateScreen.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static String routeName = "DetailsScreen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final itemId = int.parse(Get.arguments['itemID'].toString());

  final controllers = Get.put(DetailsController());

  final imageControllers = Get.put(ImagesOperation());
  late ItemInfo item;
  bool isLiked = false;

  RxList<File> imageFiles = <File>[].obs;

  @override
  void initState() {
    super.initState();
    // _sliderController = CarouselSliderController();
    getImages();
    _setItemInitialized();
    // _getItemFromDatabase();
  }

  _setItemInitialized()  {
    controllers.getItems();
    // List<ItemInfo> itemInfo = controllers.itemList;
    // debugPrint(itemInfo.length.toString());
    // setState((){
      item = controllers.itemList.firstWhere((element) => element.id == itemId);
    // });

  }
_getItemFromDatabase() async{
  item = await controllers.getItemById(itemId);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              _editItem(item);

            }, icon: const Icon(Icons.edit,color: Colors.greenAccent,)),
            IconButton(
                onPressed: () async {
                  var result = await alertDialogs.yesNoDialog(
                      context, "حذف معلومات", "هل تريد تأكيد على حذف ؟");
                  if (result == DialogsAction.yes) {
                    controllers.delete(item.id!);
                    _deleteImage(item.id);
                    Get.back();
                  }
                },
                icon: const Icon(Icons.delete,color: Colors.redAccent,)),
            LikeButton(
                isLiked: getIsLikedValue(),
                circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLike) {
                  // onLikeButtonTapped(isLiked);
                  return Icon(
                    Icons.star,
                    color: isLike ? Colors.red : Colors.grey,
                  );
                },
                onTap: (isLike) async {
                  return   await onLikeButtonTapped(isLiked);

                }),
          ],
          backgroundColor: hexStringToColor("3e7dca"),
          title: Text(
            item.name!,
            style: titleStyle.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        // backgroundColor: Colors.white.withOpacity(0.85),
        body: SingleChildScrollView(
            child: Container(

                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      detailContainer(Text(
                        "${item.museumNumber}: الرقم المتحفي",
                        style: subHeadingStyle,
                      )),
                      detailContainer(Text(
                        "${item.storeNumber}: الرمز المخزني ",
                        style: subHeadingStyle,
                      )),
                      detailContainer(Text(
                        "الاسم: ${item.name} ",
                        style: subHeadingStyle,
                      )),
                      detailContainer(Text(
                        "التاريخ الصنع:  ${item.Date} ",
                        style: subHeadingStyle,
                        textAlign: TextAlign.right,
                      )),
                      detailContainer(Text(
                        "اسم الصانع: ${item.manufacturersName}",
                        style: subHeadingStyle,
                        textAlign: TextAlign.right,
                      )),
                      detailContainer(Text(
                        "مادة الصنع: ${item.material}",
                        style: subHeadingStyle,
                        textAlign: TextAlign.right,
                      )),
                      _showImages(),
                      detailContainer(Text(
                        "الوصف : ${item.details!}",
                        style: subHeadingStyle,
                        textAlign: TextAlign.right,
                      )),
                    ]))));
  }

  Widget detailContainer(Widget widget) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: hexStringToColor("F5E548").withOpacity(0.1),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: widget);
  }

  Widget _showImages() {
    return Obx(() {
      if (imageFiles.isEmpty) {
        return Image.asset("assets/Images/Empty.jpg");
      } else {
        return SizedBox(
            height: 500,
            child: CarouselSlider.builder(
              // scrollDirection: Axis.vertical,
              autoSliderDelay: const Duration(seconds: 5),
              slideBuilder: (index) {
                return Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color:
                                  hexStringToColor("F5E548").withOpacity(0.1),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 5.0),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: PhotoView(
                      imageProvider: FileImage(
                        imageFiles[index],
                      ),
                    ));
                // enableAutoSlider: true,
              },
              autoSliderTransitionCurve: Curves.easeOutQuad,
              unlimitedMode: true,
              slideTransform: const CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                // alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(bottom: 32),
                indicatorBorderColor: Colors.yellowAccent,
                currentIndicatorColor: Colors.blueAccent,
                // itemSpacing: 12
              ),
              itemCount: imageFiles.length,
              initialPage: 0,
            ));
      }
    });
  }

 Future<bool> onLikeButtonTapped(bool isLiked) async {

    if (item.special == 1) {
      item.special = 0;
    } else {
      item.special = 1;
    }
    try {
      String query =
          "UPDATE ItemInfo SET special = ${item.special} WHERE id = ${item.id}";
      await controllers.updateQuery(query);
      setState(() {

      });
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  bool getIsLikedValue() {
    return (item.special == 1);
  }

  void selectCategory(String catId, String catTitle) {
    Get.toNamed('/${CategoryPieces.routeName}', arguments: {
      'catId': catId,
      'title': catTitle,
    });
  }

  void getImages() async {
    final path = Directory('/storage/emulated/0/Al-Kafeel Museum/$itemId/');
    if (await path.exists()) {
      List<FileSystemEntity> filesEntity = path.listSync();
      for (FileSystemEntity fileEntity in filesEntity) {
        imageFiles.add(File(fileEntity.path));
      }
    }
  }

  void _deleteImage(int? id) async {
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

  void _editItem(ItemInfo item) {
    Get.toNamed('/${UpdateScreen.routeName}', arguments: {
      'itemId': item.id,
      'title': "",
    });
  }
}
