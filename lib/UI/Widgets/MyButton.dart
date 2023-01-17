import 'package:flutter/material.dart';
import 'package:untitled1/UI/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.backColor, required this.widthButton,
      })
      : super(key: key);
  final String label;
  final Function() onTap;
  final Color backColor;
  final double widthButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: widthButton,
        height: 40,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                offset: const Offset(5, 0.1),
                blurRadius: 10.0),
          ],
          borderRadius: BorderRadius.circular(13),
          color: backColor,
        ),
        child: Text(label,
            style: headingStyle.copyWith(fontSize: 15,color: Colors.white)
            // const TextStyle(
            //   color: Colors.white,
            //   fontWeight: FontWeight.w400,
            //   fontSize: 18,
            //   fontFamily: "ArbFONTS-ReemKufi-SemiBold",
            // ),
            ),
      ),
    );
  }
}
