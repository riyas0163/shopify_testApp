


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/model/Brand_model.dart';

import '../../../utils/exeptions/firebase_auth_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();


  /// variables
final _db = FirebaseFirestore.instance;



/// get all categories

 Future<List<BrandModel>> getAllbrands () async{
   try{

     final snapshot =  await _db.collection('Brands').get();
     final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

     return result;


   }on FirebaseException catch (e) {
     throw TFirebaseAuthException(e.code).message;
   } catch (e){
     throw 'something went wrong ,please try again';
   }
 }



  /// Get brands for category






}