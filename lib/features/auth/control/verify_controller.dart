import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopify/common/widgets/success_screen/success_screen.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/utils/constants/text_strings.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../../../utils/constants/image_strings.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  /// send email whennever verify screen uppers & set timer for auto redirect
  @override
  void onInit() {
    sendemailVerification();
    setTimerAutoRedirect();
    // TODO: implement onInit
    super.onInit();
  }

  ///1. send email verification

  sendemailVerification() async {
    try {
      await Authrepository.instance.sendEmailverification();
      Tloaders.successSnackbar(
          title: 'Email sent',
          message: "please check your inbox and verify your email");
    } catch (e) {
      Tloaders.errorSnackbar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// 2. timer to automatically redirect on email verification
  setTimerAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      /// ? user can be null  // ?? email-verified is null

      ///if has to be false if function will be keep running

      /// if has to be true timer cancel and move the success screen
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: Timages.run1,
            title: TTexts.youraccountcreatedtitle,
            subtitle: TTexts.youraccountcreatedsubtitle,
            onpressed: ()=> Authrepository.instance.screenRedirect()));
      }
    });
  }

  /// manually check email is verified

  /// 3.if current user email has been verified move to success screen and screen redirect
checkemailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
          image: Timages.run1,
          title: TTexts.youraccountcreatedtitle,
          subtitle: TTexts.youraccountcreatedsubtitle,
          onpressed: ()=> Authrepository.instance.screenRedirect()));
    }
}



















}
