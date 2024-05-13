

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/model/banner_modek.dart';

import '../../../utils/exeptions/firebase_exceptions.dart';

class BannersRepository extends GetxController{
  static BannersRepository get instance => Get.find();


  /// variable

final _db = FirebaseFirestore.instance;


/// get all order related to current User
Future<List<BannerModel>> fetchBanners() async {
  try{
    
    final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();/// in here when the banner values are active is true get the all banners field and set to result variable
    return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList(); /// extract  receive the entries categories convert to json to model return as a list.
    
    
  } on FirebaseException catch (e){
    throw TFirebaseExceptions(e.code).message;
  } catch (e) {
    throw 'Something went wrong ,please try again';
  }
}


/// upload banners to the cloud firebase
}