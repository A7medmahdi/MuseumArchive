import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Helper/color_utils.dart';
import 'package:untitled1/UI/theme.dart';
import '../../Helper/size_config.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    this.backColor, this.textInputType,
    this.enabled,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final Color? backColor;
  final bool? enabled;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      // padding: const EdgeInsets.only(top: 8),
      margin: const EdgeInsets.only(left: 14),
      // width: SizeConfig.screenWidth,
      // height: 52,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all( 8),
            // margin: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black87),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 5.0),
              ],
              color: backColor,
            ),
            width: SizeConfig.screenWidth,
            height: 52,
            child: Row(
              children: [
                widget ?? Container(color: Colors.deepPurple,),
                Expanded(
                  child: TextFormField(
                    enabled: enabled,
                    keyboardType: textInputType,
                    controller: controller,
                    autofocus: false,
                    readOnly: widget != null ? true : false,
                    cursorColor: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    style: textEditeRedStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: textEditeRedStyle.copyWith(fontSize: 14),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryClr, width: 0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryClr, width: 0),
                      )))),
              ]))]));
  }
}
