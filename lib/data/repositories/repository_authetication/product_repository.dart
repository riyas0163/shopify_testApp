import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/exeptions/firebase_exceptions.dart';

import '../../../features/shop/model/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // fireStore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /// get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(10)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// get products bease on brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querysnapshot = await query.get();
      final List<ProductModel> productlist = querysnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productlist;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

/// get firebase products
  Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get(); /// call the database pass the collecton name get the document id where to take a list of productIds
      return snapshot.docs.map((QuerySnapshot) => ProductModel.fromSnapshot(QuerySnapshot)).toList(); ///
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
          : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// upload dummy data cloud firebase
// Future<void> uploadDummydata(List<ProductModel> products) async {
//   try{
//
//     // upload all the products along with their images
//     final storage = Get.put(TfirebaseStroageService());
//
//
//     // loop through each products
//     for(var product in products) {
//       // get image data link from local assets
//       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
//
//       // upload image and get its URL
//       final url = await storage.uploadImageData('Products/Image', thumbnail, product.thumbnail.toString());
//
//       // assign URL to product.thumbnail attribute
//       product.thumbnail = url;
//
//
//       // product list of images
//       if (product.images != null && product.images!.isNotEmpty) {
//         List<String> imagesUrl = [];
//         for (var image in product.images!) {
//           // get image link from local assets
//           final assetImage = await storage.getImageDataFromAssets(image);
//
//           // upload image and get its URL
//           final url = await storage.uploadImageData(
//               'Products/Image', assetImage, image);
//
//           // assign URL to product.thumbnail attribute
//           imagesUrl.add(url);
//         }
//         product.images!.clear();
//         product.images!.addAll(imagesUrl);
//       }
//
//       // upload variation images
//        // ProductType add in enum
//       if (product.productType == ProductType.variable.toString()) {
//         for (var variation in product.productVariations!) {
//           // get image data link from local assets
//           final assetImage = await storage.getImageDataFromAssets(
//               variation.image);
//
//           // upload image and get its URL
//           final url = await storage.uploadImageData(
//               'Products/Image', assetImage, variation.image);
//
//           // assign URL to variation.image attribute
//           variation.image = url;
//         }
//       }
//
//       // store product in fireStore
//       await _db.collection("Products").doc(product.id).set(product.toJson());
//     }
//   } on FirebaseException catch (e) {
//     throw e.message!;
//
//
//   }
//
//
//
//
//
//
//
//
//
//
//
// }
}
