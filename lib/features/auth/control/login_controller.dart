import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/utils/constants/image_strings.dart';
import 'package:shopify/utils/popups/full_screen_loader.dart';
import 'package:shopify/utils/popups/loader.dart';

import 'network_manager.dart';

class LoginController extends GetxController {


  /// variables

  ///bool variables    obs using is a RX boolean  variable  getX feature to redraw  state on the design

  /// stateful widget can be redraw the design using set-state  method
  final rememberme = false.obs;
  final hidepassword = true.obs;


  final localstorage = GetStorage();
  /// save user data in page


   final email = TextEditingController();
   final password = TextEditingController();

   /// form validation form key
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();


  // @override
  // void onInit() {
  //   email.text = localstorage.read('REMEMBER_ME_EMAIl');
  //   password.text = localstorage.read('REMEMBER_ME_PASSWORD');
  // }

  Future<void> emailAndPasswordSignIn() async {
    try {

      // start loading
      TFullscreenloader.openloadingDialogue('Logging in', Timages.loading);

      /// internet connectivity
      final isconnected = await Networkmanager.instance.isConnected();
      if (!isconnected) {
        TFullscreenloader.stopLoading();
        return;
      }

      // form validation
      if (!loginformkey.currentState!.validate()) {
        TFullscreenloader.stopLoading();
        return;
      }

      /// save data if remember me is selected stored data in getstorage

      if(rememberme.value) {
        localstorage.write('REMEMBER_ME_EMAIl', email.text.trim());
        localstorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }


      /// login user using Email & password Authentication

       await Authrepository.instance.loginEmailandPassword(email.text.trim(), password.text.trim());

      // remove the loader
      TFullscreenloader.stopLoading();

      /// redirect
      Authrepository.instance.screenRedirect();


    } catch (e) {
      TFullscreenloader.stopLoading();
      Tloaders.errorSnackbar(title: 'Oh Snap',message: e.toString());
    }
  }

















}