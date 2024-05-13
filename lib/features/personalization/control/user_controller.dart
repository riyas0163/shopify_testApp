import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify/common/widgets/login/login.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/data/repositories/repository_authetication/user_repository.dart';
import 'package:shopify/features/auth/control/network_manager.dart';
import 'package:shopify/features/personalization/model/user_model.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/popups/full_screen_loader.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../../../utils/constants/image_strings.dart';
import '../screen/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

final profileLoading = false.obs;
  Rx<Usermodel> user = Usermodel.empty().obs; /// obs means observable if we wants to update this user it could be redraw the user.

  final hidepassword  = false.obs;
  final imageloader = false.obs;
  final verifyemail = TextEditingController();
  final verifypassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormkey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

 Future<void> fetchUserRecord()  async{
    try{
      profileLoading.value= true;
      final user = await userRepository.fetchUserdetails();
      this.user(user);

    } catch (e){
      user(Usermodel.empty());
    } finally {
      profileLoading.value = false;
    }
 }
  /// save user record from any registration provider

Future<void> saveuserRecord(UserCredential? userCredential) async {
  try {
    /// refresh  the user record
    /// first update Rx user then check if user data is already stored.if not store new data
    await fetchUserRecord();


    /// if no record already stored
    if(user.value.id.isEmpty){
    if (userCredential != null) {
      // convert name to first and last name
      final nameparts = Usermodel.nameparts(userCredential.user!.displayName ?? '');
      final username = Usermodel.generateUsername(userCredential.user!.displayName ?? '');

      //Map data
      final user = Usermodel(
          id: userCredential.user!.uid,
          firstName: nameparts[0],
          lastname: nameparts.length > 1 ? nameparts.sublist(1).join('') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phonenumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? ''
      );

      // save user data
      await userRepository.saveUserRecord(user);
    }
  }
  } catch (e){
    Tloaders.warningSnackbar(title: 'Data not saved',message: 'Something went wrong while saving your information.You can re-save your data in your profile');
  }
}

/// delete account warning
void deleteWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(Tsizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure want to delete your account permanently? This is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(onPressed: () async => DeleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),

          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Tsizes.lg),
            child: Text('Delete'),
          )),
      cancel: OutlinedButton(onPressed: ()=> Navigator.of(Get.overlayContext!).pop(), child: const Text('cancel'))
    );
}


/// delete user account
  /// Error on this last because we are not using google signIn

void DeleteUserAccount() async {
    try{
      TFullscreenloader.openloadingDialogue('Processing', Timages.run1);

      /// First authenticate user
      final auth = Authrepository.instance;
      final provider = auth.authuser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // Re verify Auth Email
        if(provider == 'google.com'){

          await auth.deleteAccount();
          TFullscreenloader.stopLoading();
          Get.offAll(()=> const login());
        } else if(provider == 'password') {
          TFullscreenloader.stopLoading();
          Get.to(()=> const ReauthLoginForm());
        }
      }
    } catch (e) {
      TFullscreenloader.stopLoading();
      Tloaders.warningSnackbar(title: 'Oh snap',message: e.toString());
    }
}


/// RE- Authenticate before deleting

Future<void> reAuthenticateEmailAndPassword() async {
    try{
      TFullscreenloader.openloadingDialogue('Processing', Timages.run1);

      // check internet
      final isConnected = await Networkmanager.instance.isConnected();
      if(!isConnected){
        TFullscreenloader.stopLoading();
        return;
      }


      if(!reAuthFormkey.currentState!.validate()){
        TFullscreenloader.stopLoading();
        return;
      }

      await Authrepository.instance.reAuthenticateEmailAndPassword(verifyemail.text.trim(),verifypassword.text.trim());
      await Authrepository.instance.deleteAccount();
      TFullscreenloader.stopLoading();
      Get.off(()=> const login());
    } catch (e){
      TFullscreenloader.stopLoading();
      Tloaders.warningSnackbar(title: 'Oh snap',message: e.toString());
    }
}

/// upload profile image
uploadProfilePictiure() async {
 try{
   /// click the function open the user gallery pick the image
   final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
   if(image != null){
     imageloader.value = true;
     /// upload image
     final imageurl = await  userRepository.uploadImage('Users/Images/Profile/', image);

     /// update user image record
     Map<String, dynamic> json = {'profilePicture' : imageurl};
     await userRepository.updatesinglefield(json);

     user.value.profilePicture= imageurl;
     user.refresh();
     Tloaders.successSnackbar(title: 'Congratulations',message: "Your profile image has been updated");

   }
  } catch (e){
   Tloaders.errorSnackbar(title: 'Oh snap',message: 'Something went wrong : $e');
 } finally{
   imageloader.value = false;
 }
}

  Future<void> uploadProfilePicture() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageloader.value = true; // Assuming imageloader is a state variable.

        // Upload image to Firebase Storage.
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user's profile picture URL in Firestore or your backend.
        await userRepository.updateProfilePicture(imageUrl);

        // Update local user object.
        user.value.profilePicture = imageUrl;
        user.refresh(); // Refresh UI to reflect the new profile picture.

        // Show success message.
        Tloaders.successSnackbar(
          title: 'Congratulations',
          message: 'Your profile image has been updated',
        );
      }
    } catch (e) {
      // Show error message if upload fails.
      Tloaders.errorSnackbar(
        title: 'Oh snap',
        message: 'Something went wrong: $e',
      );
    } finally {
      imageloader.value = false; // Reset loading indicator.
    }
  }








}