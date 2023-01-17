import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class NoItemMsg extends StatelessWidget {
  const NoItemMsg({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                SvgPicture.asset(
                  "assets/Images/task.svg",
                  height: 290,
                  semanticsLabel: "لا يوجد معلومات",
                  color: primaryClr.withOpacity(0.3),
                ),
                Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text(
                      "لا يوجد معلومات لحد الان يرجى اضافة بعضها",
                      style: subHeadingStyle,
                      textAlign: TextAlign.center,
                    ))
              ]))
    ]);
  }
}