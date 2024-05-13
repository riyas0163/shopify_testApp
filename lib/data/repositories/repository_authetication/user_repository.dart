
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/features/personalization/model/user_model.dart';
import 'package:shopify/utils/exeptions/firebase_auth_exceptions.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();


  final FirebaseFirestore _db = FirebaseFirestore.instance;


  // function to save user data to firestore

  /// this function for usermodel is convert to json format and set to firebase collection.
  Future<void> saveUserRecord(Usermodel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }


/// fetch user details based on user ID

  Future<Usermodel> fetchUserdetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(Authrepository.instance.authuser?.uid).get();
     if(documentSnapshot.exists){
       return Usermodel.fromSnapshot(documentSnapshot);
     } else {
       return Usermodel.empty();
     }
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

/// Update user data in fireStore

  Future<void> updateuserdetail(Usermodel updateUser) async {
    try {
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

/// update any field specific user collection

  Future<void> updatesinglefield(Map<String,dynamic> json) async {
    try {
      await _db.collection('Users').doc(Authrepository.instance.authuser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

/// remove user data from fireStore

  Future<void> removeUserdata(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }


  /// upload any image from cloud firebase Storage
Future<String> uploadImage (String path,XFile image) async {   // XFile is the image picker file
  try {

    ///call firebase storage and add the path reference .child is firebase storage images saved name file
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    /// get the image from path convert to file and putfile should stored to be ref location
    await ref.putFile(File(image.path));

    /// url is download the image from ref and show from firebase storage
    final url = await ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } catch (e) {
    throw "Something went wrong, please try again";
  }
}

  Future<void> updateProfilePicture(String imageUrl) async {
    try {
      // Assuming you have a 'users' collection with user documents identified by their IDs.
      String userId = 'your_user_id'; // Replace with your actual user ID.
      DocumentReference userRef = _db.collection('users').doc(userId);

      await userRef.update({'profilePicture': imageUrl});
    } catch (e) {
      // Handle error if the update fails.
      throw Exception('Failed to update profile picture: $e');
    }
  }



















}


