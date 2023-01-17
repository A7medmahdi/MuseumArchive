import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'package:getwidget/types/gf_border_type.dart';
import 'package:untitled1/Helper/color_utils.dart';

import '../UI/theme.dart';

class GFToastShow {
  void showSuccess(String message, BuildContext context) {
    GFToast.showToast(message, context,
        toastPosition: GFToastPosition.TOP,
        textStyle: TextStyle(
            fontSize: 16,
            color: Get.isDarkMode ? GFColors.DARK : GFColors.LIGHT),
        backgroundColor: Get.isDarkMode ? GFColors.LIGHT : GFColors.DARK,
        trailing: const Icon(
          Icons.save,
          color: GFColors.SUCCESS,
        ));
  }
  void showFail(String message, BuildContext context) {
    GFToast.showToast(message, context,
        toastPosition: GFToastPosition.TOP,
        textStyle: TextStyle(
            fontSize: 16,
            color: Get.isDarkMode ? GFColors.DARK : GFColors.LIGHT),
        backgroundColor: Get.isDarkMode ? GFColors.LIGHT : GFColors.DARK,
        trailing: const Icon(
          Icons.error,
          color: GFColors.DANGER,
        ));
  }
  Widget setBorder(Widget widget) {
    return GFBorder(
        color: hexStringToColor("9DA1E3"),
        dashedLine: const [10,10],
        type: GFBorderType.rRect,
        radius: const Radius.circular(20),
        strokeWidth: 3,
        child: widget);
  }
}
