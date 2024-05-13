import 'package:flutter/material.dart';

class Tcolors{
  Tcolors._();

  //app basic color
  static   Color primary = const Color(0xFF4B68FF);
  static Color secondary = const Color(0xFFFFE24B);
  static Color accent = const Color(0xFFb0c7ff);


  // gradient colors

  static Gradient linerGradient = const LinearGradient(
    begin: Alignment(0.0,0.0),
      end: Alignment(0.707, -0.707),
      colors: [
    Color(0xffff9a9e),
      Color(0xfffad0c4),
        Color(0xfffad0c4),
  ]);
  //text color
  static Color textprimary = const Color(0xFF333333);
  static Color textsecondary = const Color(0xFF6C757D);
  static Color textaccent = Colors.white;

  //background color
  static Color light = Colors.white;
  static Color dark = Colors.black;
  static Color primarybc= Colors.white;

  //background container
  static Color lightcontainer = Colors.white;
  static Color darkcontainer = Colors.black;
}