import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:unicons/unicons.dart';
import 'package:untitled1/Helper/GFToastShow.dart';
import 'package:untitled1/Helper/size_config.dart';
import 'package:untitled1/UI/theme.dart';
import 'package:untitled1/services/Snackbars.dart';

import '../../../Controllers/ImageOprations.dart';
import '../../../Helper/color_utils.dart';
import '../../Widgets/CreateSliverAppBar.dart';
import '../Categories/catgory_pieces.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);
  static const routeName = "ImageScreen";

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ImagesOperation _imagesOperation = ImagesOperation();
  var imagePathController = TextEditingController();
  File? image;
  String? path;
  int? itemId;
  int? catId;

  final bool _isPlaying = true;
  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    // _sliderController = CarouselSliderController();
    // _imagesOperation. getImages(itemId!);
    itemId = int.parse(Get.arguments['itemId'].toString());
    catId = int.parse(Get.arguments['catId'].toString());
  }

  Future<String?> externalFolder() async {
    // itemId = int.parse(Get.arguments['itemId'].toString());
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    if (await Permission.manageExternalStorage.isGranted) {
      final path = Directory('/storage/emulated/0/Al-Kafeel Museum/$itemId/');
      if (await path.exists()) {
        return path.path;
      } else {
        final Directory appDocDirNewFolder = await path.create(recursive: true);
        return appDocDirNewFolder.path;
      }
    } else {
      SnackBars().snackBarFail(
          "رجاء اعطاء صلاحية الوصول الى ذاكرة النظام", 'No image selected.');
      return null;
    }
  }

  Future pickImage(String path, ImageSource source, String fileName) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    final extension = p.basename(pickedFile.path);
    var pickedFile2 = File(pickedFile.path);
    final newPath = p.join(path, extension);
    File newImage = await pickedFile2.copy(newPath);
    newImage = await changeFileNameOnly(newImage, '$fileName.png');
    setState(() {
      image = newImage;
    });
  }

  Future<File> changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        // backgroundColor: hexStringToColor("fffafa"),
   body: NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
    return <Widget>[
    createImageSilverAppBar("background4InputScreen2",30),
    ];
    },
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("أضافة صور",style: headingStyle.copyWith(color: getColorByMode()),),
                  Obx(() {
                    if (_imagesOperation.imageFiles.isEmpty) {
                      return const EmptyImage();
                    }
                    return SizedBox(
                       height:SizeConfig.screenHeight -50,
                      // width: SizeConfig.screenWidth,
                      child: CarouselSlider.builder(
                        // scrollDirection: Axis.vertical,
                        autoSliderDelay: const Duration(seconds: 5),
                        slideBuilder: (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(

                                  // margin: const EdgeInsets.only(top: 15),
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black87),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: hexStringToColor(
                                                "F5E548")
                                                .withOpacity(0.1),
                                            offset: const Offset(1.1, 1.1),
                                            blurRadius: 5.0),
                                      ],
                                      borderRadius: BorderRadius.circular(
                                          15)),
                                  child: Container(


                                    // margin: const EdgeInsets.only(top: 15),
                                    padding: const EdgeInsets.all(15),
                                    child: Image.file(
                                        _imagesOperation.imageFiles[index],
                                        fit: BoxFit.contain),
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    _deleteImage(index+1);
                                    await _imagesOperation.getImages(
                                        itemId!);
                                  },
                                  icon: const Icon(
                                    Icons.delete, color: Colors.red,)),
                            ],
                          );
                        },
                        autoSliderTransitionCurve: Curves.easeOutQuad,
                        // unlimitedMode: true,
                        slideTransform: const CubeTransform(),
                        slideIndicator: CircularSlideIndicator(
                          // alignment: Alignment.center,
                            padding: const EdgeInsets.only(bottom: 32),
                            indicatorBorderColor: Colors.yellowAccent,
                            currentIndicatorColor: Colors.white
                          // itemSpacing: 45
                        ),
                        itemCount: _imagesOperation.imageFiles.length,
                        initialPage: 0,
                        // enableAutoSlider: true,
                      ),
                    );
                  }),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GFButton(
                            textStyle: subHeadingStyle.copyWith(
                                color: getColorByMode()),
                            text: "معرض الصور",
                            onPressed: () async {
                              String? path = await externalFolder();
                              if (path == null || path.isEmpty) return;
                              await pickImage(
                                  path,
                                  ImageSource.gallery,
                                  (_imagesOperation.imageFiles.length + 1)
                                      .toString());
                              _imagesOperation.getImages(itemId!);
                              // _imagesOperation.itemCount ++;

                              // getImages();
                              SnackBars().snackBarSuccess('تم الحفظ', "");
                            },
                            icon: const Icon(
                              UniconsLine.image_download,
                            ),
                            color: getColorByMode(),
                            type: GFButtonType.outline,
                            size: GFSize.LARGE,
                            shape: GFButtonShape.pills),
                        const SizedBox(
                          width: 24,
                        ),
                        GFButton(
                          text: "كامرة",
                          textStyle:
                          subHeadingStyle.copyWith(color: getColorByMode()),
                          onPressed: () async {
                            String? path = await externalFolder();
                            if (path != null) {
                              await pickImage(
                                  path,
                                  ImageSource.camera,
                                  (_imagesOperation.imageFiles.length + 1)
                                      .toString());
                              _imagesOperation.getImages(itemId!);
                            }
                          },
                          shape: GFButtonShape.pills,
                          icon: const Icon(
                            UniconsLine.camera,
                            // size: 85,
                          ),
                          color: getColorByMode(),
                          type: GFButtonType.outline,
                          size: GFSize.LARGE,
                          onLongPress: () {
                            GFToastShow().showFail("message", context);
                          },
                        )
                      ]),
                  GFButton(
                      textStyle: subHeadingStyle.copyWith(
                          color: getColorByMode()),
                      text: "تم",
                      onPressed: ()  {
                        Get.toNamed('/${CategoryPieces.routeName}',arguments: {
                          'catId': catId,
                        });
                      },
                      icon: const Icon(
                        UniconsLine.backward,
                      ),
                      color: getColorByMode(),
                      type: GFButtonType.outline,
                      size: GFSize.LARGE,
                      shape: GFButtonShape.pills),

                ]

            ),

        )));
  }

  void _deleteImage(int index) async {
    debugPrint(index.toString());
    final path = Directory('/storage/emulated/0/Al-Kafeel Museum/$itemId/$index.png');
    try {
      debugPrint(path.path);
      File image = File(path.path);
      await image.delete();
    } catch (ex) {
      GFToastShow().showFail("الملف غير موجود", context);
      GFToastShow().showFail(ex.toString(), context);
    }

}
// void saveData(String path, int itemId) async {
//   // var info = Imageinfo(imageId: null, path: path, itemId: itemId);
//   // // var result = await _imagesOperation.insertData(info);
//   // debugPrint(result.toString());
//   // SnackBars().snackBarSuccess('تم الحفظ', result.toString());
// }
}

class EmptyImage extends StatelessWidget {
  const EmptyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: hexStringToColor("F5E548")
                    .withOpacity(0.1),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Image.asset(
          "assets/Images/Empty.jpg",
          fit: BoxFit.contain,
        ));
  }
}

