
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify/utils/exeptions/firebase_exceptions.dart';

class TfirebaseStroageService extends GetxController {
  static TfirebaseStroageService get instance => Get.find();


  final _firebaseStorage = FirebaseStorage.instance;

  /// upload local assets from IDE
/// returns a Uint8list containing a image data

  /// get the image from the asset and convert to the imagedata
Future<Uint8List> getImageDataFromAssets(String path) async {
  try {

    final byteData = await rootBundle.load(path);
    final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
    return imageData;
  } catch (e) {
    throw "Something went wrong : $e";
  }
}


/// upload image using imagedata on cloud firebase storage
/// retuns the download URL of the uploaded image

Future<String> uploadImageData(String path,Uint8List image, String name) async {
  try{

    final ref = _firebaseStorage.ref(path).child(name);
    await ref.putData(image);
    final url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    throw "something went wrong";
  }
}




  /// upload image using imagedata on cloud firebase storage
  /// retuns the download URL of the uploaded image
Future<String> uploadImageFile( String path, XFile image) async{
  try{
    final ref = _firebaseStorage.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e){
    throw TFirebaseExceptions(e.code).message;
  } catch (e) {
    throw 'Something went wrong ,please try again';
  }
}











}