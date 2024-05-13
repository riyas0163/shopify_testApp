import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/widgets/login/login.dart';


class Onboardingcontroler extends GetxController {
  static Onboardingcontroler get instance => Get.find();

  // variables
  final pagecontroller = PageController();
  Rx<int> currentpageIndex = 0.obs;


  ///update current index when page scroll
void updatepageindicator(index) =>currentpageIndex.value = index;



  // jump to the specific dot selected page
void dotnavigatorclick(index) {
  currentpageIndex.value = index;
  pagecontroller.jumpTo(index);
}


  /// update current index jump to next page
  void nextpage() {
  if(currentpageIndex.value == 2){
    final storage = GetStorage();
    storage.write("isFirstTime", false);
    Get.offAll( ()=> const login());
  } else{
    int page = currentpageIndex.value + 1;
    pagecontroller.jumpToPage(page);
  }
  }

  ///update current index jump to the last page
void skippage() {
  currentpageIndex.value = 2;
  pagecontroller.jumpToPage(2);
}
}