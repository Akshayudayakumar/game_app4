import 'package:flutter/material.dart';

class ColorTheme {
  static Color maincolor = Color(0xff67729D);
  static Color secondarycolor = Color(0xffD9E1FF);
  static Color primarycolor = Color(0xffE9ECFB);
  static Color white = Color(0xFFffffff);
  static Color grey = const Color(0xFF989898);
  static Color black = const Color.fromARGB(255, 0, 0, 0);
  static Color red = const Color.fromARGB(255, 209, 0, 0);
  static Color green = const Color(0xFF00c254);
  static Color lightgrey = const Color(0xFFBBBBBB);
  static Color Transperance = Colors.transparent;
}

double constantsize(BuildContext context) {
  return MediaQuery.of(context).size.width * (1 / 411);
}
