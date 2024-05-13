import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/user_repository.dart';
import 'package:shopify/features/auth/control/network_manager.dart';
import 'package:shopify/features/personalization/control/user_controller.dart';
import 'package:shopify/utils/popups/full_screen_loader.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../../../utils/constants/image_strings.dart';
import '../../personalization/screen/profile/edit_profile.dart';

class UpdatenameCntroller extends GetxController {
  static UpdatenameCntroller get instance => Get.find();




  final firstname = TextEditingController();
  final lastname  = TextEditingController();
  final userController = UserController.instance;
  final userrepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUsernameFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }


  Future<void> initializeNames() async {
    firstname.text = userController.user.value.firstName;
    lastname.text = userController.user.value.lastname;
  }

   Future<void> updateUserName() async {
    try{
      /// start loading
      TFullscreenloader.openloadingDialogue('We are processing your information', Timages.run1);


      /// check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if(!isConnected) {
        TFullscreenloader.stopLoading();
        return;
      }

      /// form validation
      if(!updateUsernameFormkey.currentState!.validate()){
        TFullscreenloader.stopLoading();
        return;
      }

      /// update users first name & last name in the firebase FireStore
      Map<String, dynamic> name = {'firstName' : firstname.text.trim(),'lastname': lastname.text.trim()};
      await userrepository.updatesinglefield(name);

      /// update the Rx user value

      userController.user.value.firstName = firstname.text.trim();
      userController.user.value.lastname = lastname.text.trim();


      /// remove loader
      TFullscreenloader.stopLoading();

      // show success message
      Tloaders.successSnackbar(title: 'Congratulations',message: 'Your name has been updated');

      // move to previous screen
      Get.offAll(() =>  const Shopifyprofile());

    }catch (e) {
      TFullscreenloader.stopLoading();
      Tloaders.errorSnackbar(title: 'Oh Snap',message: e.toString());
    }
   }



















}