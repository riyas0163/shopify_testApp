import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceutils{
  static void hidekeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
  static Future<void> setstatusbarcolor(Color color)async  {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool islandscopeorientaion(BuildContext context) {
    final viewinsets= View.of(context).viewInsets;
    return viewinsets.bottom==0;
  }

  static bool isportraitorentation(BuildContext context) {
    final viewinsets = View.of(context).viewInsets;
    return viewinsets.bottom!=0;
  }

  static void setfullscreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(enable? SystemUiMode.immersiveSticky: SystemUiMode.edgeToEdge);
  }
  static double getscreenheight() {
    return MediaQuery.of(Get.context!).size.height;

  }

  static double getscreenwidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getpixelratio(){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getstatusbarheight(){
    return MediaQuery.of(Get.context!).padding.top;
  }
  static double getbottomnavigationbargeight(){
    return kBottomNavigationBarHeight;
  }

  static double getappbargeight(){
    return kToolbarHeight;
  }

  static double getkeyboardheight(){
    final viewinsets = MediaQuery.of(Get.context!).viewInsets;
    return viewinsets.bottom;
  }

  static Future<bool>iskeyboardvisible()async {
    final viewinsets = View.of(Get.context!).viewInsets;
    return viewinsets.bottom>0;
  }

  static Future<bool> isphysicaldevice() async {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate (Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration,()=> HapticFeedback.vibrate());
  }

  static Future<void> setprefferorientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hidestatusbar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual , overlays: []);
  }

  static void showstatusbar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasinternetconnection()async {
    try{
      final result = await InternetAddress.lookup("example.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    }on SocketException
    {
      return false;
    }
  }

  static bool isIOS(){
    return Platform.isIOS;
}
  static bool isAndroid(){
    return Platform.isAndroid;
  }

  static void launchurl(String url) async {
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }else {
      throw "could not launch $url";
    }
  }












}