

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopify/common/widgets/login/login.dart';
import 'package:shopify/data/repositories/repository_authetication/user_repository.dart';
import 'package:shopify/features/auth/screen/screen_onboarding/onboarding.dart';
import 'package:shopify/features/auth/screen/signup_screen/verify_email.dart';
import 'package:shopify/utils/exeptions/firebase_auth_exceptions.dart';
import 'package:shopify/utils/exeptions/firebase_exceptions.dart';
import 'package:shopify/utils/local_storage/storage_utility.dart';

import '../../../bottom_navigation.dart';

class Authrepository extends GetxController{
  static Authrepository get instance => Get.find();




  // create a empty variable
final devicestorage = GetStorage();
final _auth = FirebaseAuth.instance; // get permission of firebase auth


  /// get authenticate user data
 User? get authuser => _auth.currentUser;

// to get this function type ctrl + O and type
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  void screenRedirect() async {

    /// current user is null and email has been verified  if move to bottom navigator menu

    /// else current user is not  null move to email verify screen
    final user = _auth.currentUser;
    if(user != null){
     if(user.emailVerified){

       // initialize user specific storage
       await Tlocalstorage.init(user.uid);/// pass the bucket as to be a user and uid .uid is a firebase authentication uid is unique to user


       Get.offAll(()=> const bottom());
     }else{
       Get.offAll(()=> Emailverify(email: _auth.currentUser?.email,));
     }
    }else{
      //local storage
      devicestorage.writeIfNull("isFirstTime", true);


      devicestorage.read("isFirstTime") != true
          ? Get.offAll(()=> const login()) // redirect to login if not the first time
          : Get.offAll(()=> const on());  // redirect to on screen if it the first time

      /// if 1st time the user came onboarding screen will work and going to false.next time the same user come going to login screen
    }
  }

///[Email auth] - 1.register
Future<UserCredential> registerEmailandPassword(String email,String password,) async {
    try {
     // await _auth.currentUser!.updateEmail(email);
     // await _auth.currentUser!.updatePassword(password);
     return  await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e){
      throw 'something went wrong ,please try again';
    }
}
  /// it could be work in cloud storage
  ///[EmailVerification] - 2.Mail verification for email confirmation
  Future<void> sendEmailverification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on TFirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  ///[Email auth] -3. signIn or Login

  Future<UserCredential> loginEmailandPassword(String email, String password) async {
    try{
      return   await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on TFirebaseExceptions catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }
    catch (e){
      throw "Something went wrong, Please try again";
    }
  }

///[ReAuthentication] - ReAuthenticate user
  Future<void> reAuthenticateEmailAndPassword(String email,String password) async{
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthentication
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on TFirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
///[EmailVerification] -4. Forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on TFirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }


/// logout user - valid for any authentication
Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const login());
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong ,please try again';
    }
}



/// delete user - remove user auth and fireStore account
Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserdata(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseException catch (e){
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong ,please try again';
    }
}
}










