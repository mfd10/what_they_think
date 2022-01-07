import 'package:flutter/material.dart';
import 'package:what_they_think/constants/texts.dart';

buttons(String txt, Color color, Color textColor, double wid) {
  return Container(
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
  );
}
