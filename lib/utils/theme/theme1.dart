import 'package:flutter/material.dart';
import 'package:shopify/utils/theme/custome%20theme/Textfield_theme.dart';
import 'package:shopify/utils/theme/custome%20theme/appbartheme.dart';
import 'package:shopify/utils/theme/custome%20theme/bottomsheettheme.dart';
import 'package:shopify/utils/theme/custome%20theme/checkboxtheme.dart';
import 'package:shopify/utils/theme/custome%20theme/elevatedtheme.dart';
import 'package:shopify/utils/theme/custome%20theme/outlined_button_theme.dart';
import 'package:shopify/utils/theme/custome%20theme/text%20themes.dart';

class TappTheme {
  TappTheme._();

  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: Ttexttheme.lighttexttheme,
    appBarTheme: TAppbartheme.lightappbartheme,
    bottomSheetTheme: TBottomsheettheme.lightBottomsheettheme,
    checkboxTheme: TCheckboxtheme.lightcheckboxtheme,
    elevatedButtonTheme: TElevatedTheme.lightElevatedTheme,
    outlinedButtonTheme: TOutlinedbuttontheme.lightoutlinedbuttontheme,
    inputDecorationTheme: Ttextfieldtheme.lightinputdecorationtheme,

  );
  static ThemeData darktheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: Ttexttheme.darktexttheme,
    appBarTheme: TAppbartheme.darkappbartheme,
    bottomSheetTheme: TBottomsheettheme.darkBottomsheettheme,
    checkboxTheme: TCheckboxtheme.darkcheckboxtheme,
    elevatedButtonTheme: TElevatedTheme.darkElevatedTheme,
    outlinedButtonTheme: TOutlinedbuttontheme.darktoutlinedbuttontheme,
    inputDecorationTheme: Ttextfieldtheme.darkinputdecorationtheme,


  );
}
