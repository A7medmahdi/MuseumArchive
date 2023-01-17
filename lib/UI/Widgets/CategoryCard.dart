import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:untitled1/Helper/color_utils.dart';
import 'package:untitled1/UI/theme.dart';

import '../../Controllers/CategoryController.dart';
import '../Screeons/Categories/UpdateCategory.dart';
import 'GetImageById.dart';
import 'InputField.dart';
import 'TextContainer.dart';

class CategoryCard extends StatelessWidget {
  final int catId;
  final String catName;
  final Color color;
  final TextEditingController _codeNumberController = TextEditingController();
  final CategoryController _categoryController = Get.put(CategoryController());

  CategoryCard(
      {Key? key,
      required this.catName,
      required this.color,
      required this.catId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCard(
        boxFit: BoxFit.cover,
        title: GFListTile(
            avatar: GFAvatar(
              backgroundColor: color,
              radius: 50,
              child: GetImageById(index: catId, borderRadius: 100),
            ),
            title: Text(
              catName,
              style: headingStyle.copyWith(fontSize: 35),
              textAlign: TextAlign.right,
            )),
        borderOnForeground: true,
        color: color.withOpacity(0.1),
        buttonBar: GFButtonBar(children: <Widget>[
          GFIconButton(
            onPressed: () {
              Get.toNamed('/${CategoryUpdate.routeName}', arguments: {
                'catId': catId,
                'title': catName,
                'color': colorToHex(color),
              });
            },
            color: GFColors.WARNING,
            icon: const Icon(Icons.edit),
          ),
          const SizedBox(
            width: 25,
          ),
          GFIconButton(
            onPressed: () async {
              Get.bottomSheet(
                backgroundColor: hexStringToColor("F2F2F2"),
                SizedBox(
                  height: 205,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TextContainer(text: "ادخل رمز التاكيد"),
                        InputField(
                          title: 'الرمز',
                          hint: 'الرمز',
                          controller: _codeNumberController,
                        ),
                        GFIconButton(
                          onPressed: () async {
                            if (_codeNumberController.text != "****") {
                              Get.defaultDialog(
                                title: "خطا",
                                middleText:
                                    "الرمز غير صيحيح يرجى محاولة مرة اخرى",
                                middleTextStyle: subHeadingStyle,
                                titleStyle:
                                    headingStyle.copyWith(color: Colors.red),
                              );
                              return;
                            }
                            Get.defaultDialog(
                                title: "تحذير",
                                middleText:
                                    "سوف يتم حذف جميع الفطع داخل هذه المجموعة !!",
                                middleTextStyle: subHeadingStyle,
                                titleStyle:
                                    headingStyle.copyWith(color: Colors.red),
                                textConfirm: "نعم",
                                textCancel: "الغاء",
                                onConfirm: () {
                                  _categoryController.deleteAllItems(catId);
                                  Get.back();
                                  Get.back();
                                });
                            // var result = await alertDialogs.yesNoDialog(
                            //     context, "حذف جميع القطع", "هل تريد تأكيد على حذف ؟");
                            // if (result == DialogsAction.yes) {
                            //   _categoryController.deleteAllItems(catId);
                            // }

                          },
                          icon: const Icon(
                            Icons.done,
                            size: 35,
                          ),
                          color: GFColors.DANGER,
                          size: 40,
                          // boxShadow: BoxShadow<catId,
                        )
                      ],
                    ),
                  ),
                ),
              );

              //  deleteAllItems
            },
            color: GFColors.DANGER,
            icon: const Icon(Icons.delete),
          )
        ]));
  }
}
