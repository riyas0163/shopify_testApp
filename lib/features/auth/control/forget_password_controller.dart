import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/features/auth/screen/forgot_password/reset_password.dart';
import 'package:shopify/utils/popups/full_screen_loader.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../../../utils/constants/image_strings.dart';
import 'network_manager.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();
  
  
  /// variables
 final email = TextEditingController();
 GlobalKey<FormState> forgetpasswordkey = GlobalKey<FormState>();
 
 
 /// send email through to create new password
 sendpasswordResetEmail() async{
   try{
     /// start loading
     TFullscreenloader.openloadingDialogue('Processing your request', Timages.run1);
     
     
     /// network connectivity
     final isconnected = await Networkmanager.instance.isConnected();
     if(!isconnected){
       TFullscreenloader.stopLoading();
       return;
     }
    
     
     /// form validation
     if(!forgetpasswordkey.currentState!.validate()){
       TFullscreenloader.stopLoading();
       return;
     }
     /// send email to reset password
     await Authrepository.instance.sendPasswordResetEmail(email.text.trim());
     
     /// remove the loader 
     TFullscreenloader.stopLoading();
     
     
     /// success screen 
     Tloaders.successSnackbar(title: 'Email sent',message: 'Email link sent to reset your password');
     
     /// redirect
     Get.to(()=> reset(email: email.text.trim(),));
   }catch (e) {
     TFullscreenloader.stopLoading();
     Tloaders.errorSnackbar(title: 'Oh Snap',message: e.toString());
   }
       
 }
 resendPasswordResetEMail( String email) async{
   try{

     /// start loading
     TFullscreenloader.openloadingDialogue('Processing your request', Timages.run1);


     /// network connectivity
     final isconnected = await Networkmanager.instance.isConnected();
     if(!isconnected){
       TFullscreenloader.stopLoading();
       return;
     }



     /// send email to reset password
     await Authrepository.instance.sendPasswordResetEmail(email);

     /// remove the loader
     TFullscreenloader.stopLoading();


     /// success screen
     Tloaders.successSnackbar(title: 'Email sent',message: 'Email link sent to reset your password'.tr);


   }catch (e) {
     TFullscreenloader.stopLoading();
     Tloaders.errorSnackbar(title: 'Oh Snap',message: e.toString());
   }
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
}