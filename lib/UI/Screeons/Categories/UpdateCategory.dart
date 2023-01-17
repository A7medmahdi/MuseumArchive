import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../Controllers/CategoryController.dart';
import '../../../Helper/color_utils.dart';
import '../../../Models/Category.dart';
import '../../../services/Snackbars.dart';
import '../../Widgets/CreateSliverAppBar.dart';
import '../../Widgets/InputField.dart';
import '../../Widgets/MyButton.dart';
import '../../theme.dart';

class CategoryUpdate extends StatefulWidget {
  const CategoryUpdate({Key? key}) : super(key: key);
  static String routeName = "CategoryUpdate";
  @override
  State<CategoryUpdate> createState() => _CategoryUpdateState();
}

Color pickerColor = Colors.cyanAccent;
Rx<Color> currentColor = primaryClr.obs;

class _CategoryUpdateState extends State<CategoryUpdate> {
  final catId = int.parse(Get.arguments['catId'].toString());
  final String title = Get.arguments['title'];
  final  color = Get.arguments['color'];

  final CategoryController _categoryController = Get.put(CategoryController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
                return <Widget>[
                  createImageSilverAppBar("background4InputScreen2", 50)
                ];
              },
              body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "  ادخال بيانات ",
                          style: headingStyle,
                          textAlign: TextAlign.center,
                        ),
                        InputField(
                          title: 'اسم المجموعة',
                          hint: 'اسم المجموعة',
                          // widget: Icon(Icons.inbox),
                          controller: _titleController,
                          // textInputType: TextInputType.text,
                        ),
                        InputField(
                          title: 'اللون ',
                          hint: 'اللون',
                          // widget: Icon(Icons.inbox),
                          controller: _colorController,
                          widget: Obx(() {
                            return MyButton(
                              label: "",
                              onTap: () async {
                                await colorPickerDialog();
                              },
                              // backColor: hexStringToColor("0A3A7A"),
                              backColor: currentColor.value,
                              widthButton: 35,
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyButton(
                          label: "اضـافــة",
                          onTap: () {
                            _checkData();
                          },
                          backColor: hexStringToColor("0A3A7A"),
                          // backColor: currentColor,
                          widthButton: 175,
                        ),
                      ]))),
        ));
  }

  Future colorPickerDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              'اختيار اللون',
              style: headingStyle,
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
                child: MaterialPicker(
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                  // showLabel: true, // only on portrait mode
                )));
      },
    );
  }

  void changeColor(Color color) {
    currentColor.value = color;
    _colorController.text = colorToHex(color);
  }

  _checkData() {
    if (_titleController.text.isNotEmpty && _colorController.text.isNotEmpty) {
      _updateCategory();
    }
    else {
      SnackBars().snackBarFail("خطأ", "يرجى ملئ كافة الحقول المطلوبة");
    }
  }
  _updateCategory() async {
    await _categoryController.updated(
        Category(
            color: _colorController.text,
            title: _titleController.text,
            id: catId)
    );
      SnackBars().snackBarSuccess("تم الحفظ بنجاح", "");
  }
  void initial(){
    if(title.isNotEmpty){
      _titleController.text = title;
      _colorController.text = color;
      currentColor.value = hexStringToColor(color);
    }
  }
}
