import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/UI/Screeons/Items/ImageScreen.dart';
import 'package:untitled1/services/Snackbars.dart';

import '../../../Controllers/detailsController.dart';
import '../../../Helper/color_utils.dart';
import '../../../Models/item_Info.dart';
import '../../Widgets/InputField.dart';
import '../../Widgets/MyButton.dart';
import '../../theme.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);
  static const routeName = "UpdateScreen";

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final DetailsController _detailsController = Get.put(DetailsController());

  final TextEditingController _museumNumberController = TextEditingController();
  final TextEditingController _storeNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailsTextController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _manufacturersNameController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  int? itemId;
  int? value;
  String? catTitle;
  late ItemInfo itemInfo;
  _getItemInfo() async {
    itemId = int.parse(Get.arguments['itemId'].toString());
    catTitle = '${Get.arguments['title']} ';
     itemInfo = await _detailsController.getItemById(itemId!);
    _museumNumberController.text = itemInfo.museumNumber!;
    _storeNumberController.text = itemInfo.storeNumber!;
    _nameController.text = itemInfo.name!;
    _detailsTextController.text = itemInfo.details!;
    _materialController.text = itemInfo.material!;
    _manufacturersNameController.text = itemInfo.manufacturersName!;
    _dateController.text = itemInfo.Date!;
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
     _getItemInfo();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[createSilverAppBar1()];
            },
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text(
                    "  تعديل بيانات $catTitle",
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
                    enabled: false,
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
                      MyButton(
                        label: "تحميل صورة",
                        onTap: () {
                          sendData();
                        },
                        backColor: hexStringToColor("0A3A7A"),
                        widthButton: 175,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MyButton(
                        label: "تعديل",
                        onTap: () {
                          _checkData(itemId!);
                        },
                        backColor: hexStringToColor("0A3A7A"),
                        widthButton: 175,
                      ),
                    ],
                  ),
                ]))));
  }

  _checkData(int catId) {
    if (_museumNumberController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _detailsTextController.text.isNotEmpty) {
      _updateItemInDb();
      // Get.back();
    } else {
      SnackBars().snackBarFail("خطأ", "يرجى ملئ كافة الحقول المطلوبة");
    }
  }

  _updateItemInDb() async {
    itemInfo.museumNumber= _museumNumberController.text;
    itemInfo.name= _nameController.text;
    itemInfo.details= _detailsTextController.text;
    itemInfo.storeNumber= _storeNumberController.text;
    itemInfo.manufacturersName= _manufacturersNameController.text;
    itemInfo.Date= _dateController.text;
    itemInfo.material= _materialController.text;
    await _detailsController.updated(itemInfo);
    SnackBars().snackBarSuccess("تم الحفظ بنجاح", "");
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: hexStringToColor("F5E548"),
      expandedHeight: 110,
      floating: false,
      elevation: 50,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/Images/background4InputScreen2.png',
                  fit: BoxFit.fitWidth,
                )));
      }),
    );
  }

  void sendData() {
    Get.toNamed('/${ImageScreen.routeName}', arguments: {
      'itemId': itemId!,
    });
  }
}
