import 'package:flutter/material.dart';

class TAppbartheme{
  TAppbartheme._();

  static AppBarTheme lightappbartheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size: 24,),
    actionsIconTheme: IconThemeData(color: Colors.black,size: 24,),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),
  );


  static AppBarTheme darkappbartheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size: 24,),
    actionsIconTheme: IconThemeData(color: Colors.white,size: 24,),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
  );
}