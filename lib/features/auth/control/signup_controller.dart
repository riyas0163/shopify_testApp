import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/data/repositories/repository_authetication/user_repository.dart';
import 'package:shopify/features/auth/screen/signup_screen/verify_email.dart';
import 'package:shopify/features/personalization/model/user_model.dart';
import 'package:shopify/utils/popups/full_screen_loader.dart';
import 'package:shopify/utils/popups/loader.dart';
import '../../../utils/constants/image_strings.dart';
import 'network_manager.dart';

class Signupcontroller extends GetxController{
  static Signupcontroller get instance => Get.find();


  /// variables
  final termsandcondition = false.obs; ///
  final hidepassword = true.obs;/// obs is hide and show the password
   final lastname = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();




  /// signup function


void signup() async{
   try {
     /// start loading
     TFullscreenloader.openloadingDialogue("We are processing your information", Timages.run);

     /// internet connectivity
     final isconnected = await Networkmanager.instance.isConnected();
     if (!isconnected) {
       TFullscreenloader.stopLoading();
       return;
    }
     // form validation
     if (!signupformkey.currentState!.validate()) {
       TFullscreenloader.stopLoading();
              return;
     }

    ///  privacy policy check
     if (!termsandcondition.value) {
       Tloaders.warningSnackbar(
           title: "Accept privacy and policy",
           message: "In order to create account, you must have to read and accept the Privacy Policy & Terms of use");
       return;
     }


    /// register user in the firebase authentication & save user data in the firebase

   final usercredential = await  Authrepository.instance.registerEmailandPassword(email.text.trim(), password.text.trim());

     /// save authenticated user data in the firebase fireStore

     final newuser = Usermodel(
         id: usercredential.user!.uid,
         firstName: firstname.text.trim(),
         lastname: lastname.text.trim(),
         username: username.text.trim(),
         email: email.text.trim(),
         phonenumber: phonenumber.text.trim(),
         profilePicture: ''

     );

   final userrepository = Get.put( UserRepository());
   userrepository.saveUserRecord(newuser);

   TFullscreenloader.stopLoading();

   Tloaders.successSnackbar(title: 'Congratulations',message: 'Your account has been created!');

   Get.to(()=> Emailverify(email: email.text.trim(),));


   }
   catch(e){
     TFullscreenloader.stopLoading();
     // remove loader
     Tloaders.errorSnackbar(title: 'Oh Snap',message: e.toString());

   }
}
}
