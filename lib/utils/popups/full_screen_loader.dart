import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';


class TFullscreenloader {



  static void openloadingDialogue(String text, String animation){
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false, // dialog cant be dismissed by tapping outside it
        builder: (_) => PopScope(
          canPop: false, // disable popping with the back button
            child:Container(
              height: double.infinity,
              width: double.infinity,
              color: THelperfunctions.isdarkmode(Get.context!) ? Tcolors.dark : Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  TAnimationLoaderWidget(text: text, animation: animation,

                  )

                ],
              ),
            ) ));
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}