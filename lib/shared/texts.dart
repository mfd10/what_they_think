import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color color1 = const Color(0xff34648c);
Color color2 = const Color(0xff00b8d4).withOpacity(0.3);

const TextStyle myStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.3);

textNormal(String txt, double fSize, Color color, FontWeight fw, double ls) {
  return Text(
    txt,
    style: GoogleFonts.robotoSlab(
        textStyle: TextStyle(
            fontSize: fSize, color: color, fontWeight: fw, letterSpacing: ls)),
  );
}

textField(double wid, String icon, String hintText, bool obsc,
    TextEditingController controller) {
  return Center(
    child: Container(
      width: wid,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.horizontal(left: Radius.zero, right: Radius.zero),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: TextField(
          controller: controller,
          autocorrect: false,
          obscureText: obsc,
          decoration: InputDecoration(
              icon: Image.asset(
                'assets/$icon.png',
                width: 30,
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                fontSize: 13,
                color: Colors.black26,
                fontWeight: FontWeight.w600,
              ))),
        ),
      ),
    ),
  );
}

textSignUp(
    double wid, String hintText, bool obsc, TextEditingController controller) {
  return Center(
    child: Container(
      width: wid,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: TextFormField(
          controller: controller,
          autocorrect: false,
          obscureText: obsc,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                fontSize: 13,
                color: Colors.black26,
                fontWeight: FontWeight.w600,
              ))),
        ),
      ),
    ),
  );
}
