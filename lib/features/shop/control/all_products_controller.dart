
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/product_repository.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/popups/loader.dart';

class AllProductController extends GetxController{
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortoption ='Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;


  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async{
    try{
      if(query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;


    } catch (e) {
      Tloaders.errorSnackbar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }

void sortProducts (String sortOption) {
    selectedSortoption.value = sortOption;

    switch (sortOption) {
      case 'Name' :
        products.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Highest price' :
        products.sort((a, b) => b.price.compareTo(a.price));
        break;

      case 'lowest price' :
        products.sort((a, b) => a.price.compareTo(b.price));
        break;

      case 'Newest' :
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;

      case 'sale' :
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
      // default sorting option: name
        products.sort((a,b) => a.title.compareTo(b.title));

    }
}

 void assignProducts(List<ProductModel> products) {
    /// assign products to the 'products' list
   this.products.assignAll(products);
   sortProducts('Name');
 }
}
















