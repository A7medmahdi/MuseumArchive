import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/color_utils.dart';

const Color bluishClr = Color(0xFF9BB7D4);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF25465F);
const Color darkHeaderClr = Color(0xFF25465F);

class Themes {
  static final light = ThemeData(
      primaryColor: primaryClr,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
                color: hexStringToColor("#0D0D0D"),
                fontSize: 20,
                fontFamily: 'ArbFONTS-ReemKufi-SemiBold',
                fontWeight: FontWeight.w100),

            titleMedium: TextStyle(
                color: hexStringToColor("FFFFFF"),
                fontSize: 18,
                fontFamily: 'Raleway'),
          ));
  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      backgroundColor: Colors.black54,
      brightness: Brightness.dark,
      textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
                color: hexStringToColor("#FFFFFF"),
                fontSize: 20,
                fontFamily: 'ArbFONTS-ReemKufi-SemiBold',
                fontWeight: FontWeight.w100),

            titleMedium: TextStyle(
                color: hexStringToColor("FF0000"),
                fontSize: 18,
                fontFamily: 'Raleway'),
          ));
}
Color getColorByMode(){
  return Get.isDarkMode
      ? darkHeaderClr
      : darkGreyClr;
}

TextStyle get headingStyle => GoogleFonts.amiri(
    textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.w900));

TextStyle get subHeadingStyle => GoogleFonts.amiri(
    textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold));

TextStyle get HeadingStyle => GoogleFonts.kufam(
    textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold));

TextStyle get titleStyle => GoogleFonts.amiri(
    textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600));

TextStyle get subTitleStyle => GoogleFonts.amiri(
    textStyle: TextStyle(
        color: !Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400));

TextStyle get textEditeRedStyle => GoogleFonts.amiri(
    textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        //hexStringToColor("#CF0019"),
        fontSize: 20,
        fontWeight: FontWeight.w600));

TextStyle get textEditeGreenStyle => GoogleFonts.amiri(
    textStyle: TextStyle(
        color: !Get.isDarkMode ? hexStringToColor("#085820") : Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600));
