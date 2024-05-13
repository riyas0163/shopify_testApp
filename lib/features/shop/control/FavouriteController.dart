import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/product_repository.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/local_storage/storage_utility.dart';
import 'package:shopify/utils/popups/loader.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find();

  /// variables
  final favorites = <String , bool>{}.obs; /// it will be a type key value pair. json value so always bool



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initFavourites();
  }

  // method to initialize favorite by reading from storage
  void initFavourites()  {

    /// stored data in json format so we want to encode and decode the data into json
    final json = Tlocalstorage.instance().readData('favorites');
    if(json != null) {
      /// decoding
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>; /// decode the jason data and pass to json variable
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool))); /// assign as storedFavorites decoding data to favorites key as string , value as bool

    }
  }

  /// check the current product is favourite or not based on the product id
  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }


/// add product to the function
void toggleFavoriteProduct(String productId) {

    /// check this productid is already in fovorite or not
  if(!favorites.containsKey(productId)){
    /// add
    favorites[productId] = true;

    /// save the data in local storage
    saveFovoritesToStroage();

    ///custom toste message
    Tloaders.customtost(message: 'Product has been added to the wishlist');
  } else{
    /// remove the already stored product
 Tlocalstorage.instance().removeData(productId);
 favorites.remove(productId);

 /// remove the data in local storage
 saveFovoritesToStroage();
 favorites.refresh();

 /// custom toste message
 Tloaders.customtost(message: 'Product has been removed from the wishlist');
  }
}


void saveFovoritesToStroage(){
    /// encoded json data t decode
  final encodeedFavorites = json.encode(favorites);/// json variable get to encode the json data
  Tlocalstorage.instance().writeData('favorites', encodeedFavorites);

}

/// get products from the firebase use future builder to display the products

Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
}






}