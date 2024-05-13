

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/model/category_model.dart';
import 'package:shopify/firebase_storage_service.dart';

import '../../../utils/exeptions/firebase_exceptions.dart';

class Categoryrepository extends GetxController {
  static Categoryrepository get instance => Get.find();
  
  /// variables
 final _db = FirebaseFirestore.instance;  /// create the variable mean it could be deal with firestore database


///get all the categories
 Future<List<CategoryModel>> getAllcategories() async {
   try{
      final snapshot = await _db.collection('categories').get(); /// this is get the all the collection of data from firestore catergories document
     final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList(); /// extract  receive the entries categories convert to json to model return as a list.
     return list;
   }on FirebaseException catch (e){
     throw TFirebaseExceptions(e.code).message;
   } catch (e) {
     throw 'Something went wrong ,please try again';
   }
 }

/// get sub categories



/// upload Categories to the cloud firebase
 Future<void> uploadDummyData(List<CategoryModel> categories) async {
   try {
     // upload all the categories along their images
     final storage = Get.put(TfirebaseStroageService());
     
     // loop through each category
     for(var category in categories) {

       // get Imagedata link from the local asset
       final file = await storage.getImageDataFromAssets(category.image);
       
       
       // upload image and get its url
       final url = await storage.uploadImageData('categories', file, category.name);
       

       // assign url to category.image attribute
        category.image = url;
       

       // store category in firestore
       
       await _db.collection('categories').doc(category.id).set(category.toJson());
     }
      
     
   } on FirebaseException catch (e){
     throw TFirebaseExceptions(e.code).message;
   } catch (e) {
     throw 'Something went wrong ,please try again';
   }
 }



























}
