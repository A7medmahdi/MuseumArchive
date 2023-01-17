import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/UI/Screeons/Items/ImageScreen.dart';
import 'package:untitled1/services/Snackbars.dart';
import '../../../Controllers/detailsController.dart';
import '../../../Helper/color_utils.dart';
import '../../../Models/item_Info.dart';
import '../../Widgets/CreateSliverAppBar.dart';
import '../../Widgets/InputField.dart';
import '../../Widgets/MyButton.dart';
import '../../theme.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);
  static const inputRouteName = "InputScreen";

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final DetailsController _detailsController = Get.put(DetailsController());

  final TextEditingController _museumNumberController = TextEditingController();
  final TextEditingController _storeNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailsTextController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _manufacturersNameController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  int? catId;
  int? value;
  String? catTitle;

  @override
  Widget build(BuildContext context) {
    catId = int.parse(Get.arguments['catId'].toString());
    catTitle = '${Get.arguments['title']} ';

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[
                createImageSilverAppBar("background4InputScreen2", 120)
              ];
            },
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text(
                    "  ادخال بيانات $catTitle",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  InputField(
                    title: 'الرقم المتحفي',
                    hint: ' الرقم المتحفي',
                    // widget: Icon(Icons.inbox),
                    controller: _museumNumberController,
                    // textInputType: TextInputType.text,
                  ),
                  InputField(
                    title: 'الرمز المخزني ',
                    hint: 'الرمز المخزني ',
                    // widget: Icon(Icons.inbox),
                    controller: _storeNumberController,
                    // textInputType: TextInputType.text,
                  ),
                  InputField(
                    title: 'اسم القطعة',
                    hint: ' اسم القطعة',
                    controller: _nameController,
                    // textInputType: TextInputType.text,
                  ),
                  InputField(
                    title: 'اسم الصانع',
                    hint: ' اسم الصانع',
                    controller: _manufacturersNameController,
                  ),
                  InputField(
                    title: 'مادة الصنع ',
                    hint: 'مادة الصنع',
                    controller: _materialController,
                    // textInputType: TextInputType.text,
                  ),
                  InputField(
                    title: 'سنة الصنع',
                    hint: 'سنة الصنع',
                    controller: _dateController,
                    // textInputType: TextInputType.number,
                  ),
                  InputField(
                    title: 'الوصف',
                    hint: ' الوصف',
                    controller: _detailsTextController,
                    // textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // MyButton(
                      //   label: "تحميل صورة",
                      //   onTap: () {
                      //     sendData();
                      //   },
                      //   backColor: hexStringToColor("0A3A7A"),
                      //   widthButton: 175,
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      MyButton(
                        label: "حــفــظ",
                        onTap: () async {
                          await _checkData(catId!);
                          sendData();
                        },
                        backColor: hexStringToColor("0A3A7A"),
                        widthButton: 175,
                      ),
                    ],
                  ),
                ]))));
  }

  _checkData(int catId) async {
    if (_museumNumberController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _detailsTextController.text.isNotEmpty) {
      await _addItemToDb(catId);
      // Get.back();
    } else {
      SnackBars().snackBarFail("خطأ", "يرجى ملئ كافة الحقول المطلوبة");
    }
  }

  _addItemToDb(int catId) async {
    value = await _detailsController.addItem(ItemInfo(
        museumNumber: _museumNumberController.text,
        name: _nameController.text,
        details: _detailsTextController.text,
        category: catId,
        storeNumber: _storeNumberController.text,
        manufacturersName: _manufacturersNameController.text,
        Date: _dateController.text,
        special: 0,
        material: _materialController.text,
        id: null));
    SnackBars().snackBarSuccess("تم الحفظ بنجاح", "");
  }

  // SliverAppBar createSilverAppBar1() {
  //   return SliverAppBar(
  //     backgroundColor: hexStringToColor("F5E548"),
  //     expandedHeight: 110,
  //     floating: false,
  //     elevation: 50,
  //     flexibleSpace: LayoutBuilder(
  //         builder: (BuildContext context, BoxConstraints constraints) {
  //       return FlexibleSpaceBar(
  //           collapseMode: CollapseMode.parallax,
  //           background: Container(
  //               color: Colors.white,
  //               child: Image.asset(
  //                 'assets/Images/background4InputScreen2.png',
  //                 fit: BoxFit.fitWidth,
  //               )));
  //     }),
  //   );
  // }

  void sendData() {
    if (value == null || value == 0) {
      SnackBars().snackBarFail("فشل", "يرجى حفظ معلومات اولا");
      return;
    }
    Get.toNamed('/${ImageScreen.routeName}', arguments: {
      'itemId': value!,
      'catId': catId!,
    });
  }
}
