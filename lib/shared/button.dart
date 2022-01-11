import 'package:flutter/material.dart';
import 'package:what_they_think/shared/texts.dart';

class Button extends StatelessWidget {
  final Color color, textColor;
  final VoidCallback? function;
  final double width;
  final String txt;

  Button(
      {Key? key,
      required this.color,
      required this.width,
      required this.txt,
      required this.textColor,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 55,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 8),
              ),
            ]),
        child: Center(
          child: textNormal(txt, 22, textColor, FontWeight.bold, 2),
        ),
      ),
    );
  }
}
/*

Buttons(String txt, Color color, Color textColor, double wid, Function? function) {
  return GestureDetector(
    onTap: function!(),
    child: Container(
      height: 55,
      width: wid,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 8),
            ),
          ]),
      child: Center(
        child: textNormal(txt, 22, textColor, FontWeight.bold, 2),
      ),
    ),
  );
}
*/
