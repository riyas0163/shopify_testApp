import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class Tloaders {


  static hideSnackBar()=> ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customtost({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: THelperfunctions.isdarkmode(Get.context!) ? CupertinoColors.darkBackgroundGray.withOpacity(0.9) : Colors.grey.withOpacity(0.9),
            ),
            child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge,),),
          ))
    );
  }

  static successSnackbar({required title,message = '',duration = 5}){
    Get.snackbar(
        title,
        message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Tcolors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber,color: Colors.white,)

    );

  }


  static errorSnackbar({required title,message =''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Icons.warning_amber,color: Colors.white,)
    );
  }


  static warningSnackbar({required title,message =''}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Icons.warning_amber,color: Colors.white,)

    );
  }





























}