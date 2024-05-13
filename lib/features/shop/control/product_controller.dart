
import 'package:get/get.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/constants/enums.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../../../data/repositories/repository_authetication/product_repository.dart';

class ProductController extends GetxController{
  static ProductController  get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featureProducts = <ProductModel>[].obs;
  final productrepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeatureProducts();
    super.onInit();

  }


  void fetchFeatureProducts()async {
    try{
      /// show loading while loading products
      isLoading.value = true;


      // fetch products
      final products = await productrepository.getFeaturedProducts();



      // assign products
      featureProducts.assignAll(products);
      //print(featureProducts);

    } catch (e) {
     Tloaders.errorSnackbar(title: 'Oh snap',message: e.toString());
    } finally {
      // stop loading
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeatureProducts()async {
    try{

      // fetch products
      final products = await productrepository.getFeaturedProducts();
      return products;
    } catch (e) {
      Tloaders.errorSnackbar(title: 'Oh snap',message: e.toString());
      return [];
    }
  }

//  get the product price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    /// if no variations exist , return the single price or sale price
    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // calculate the smallest and largest prices among variations
      for(var variation in product.productVariations!){
        // determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // update smallest and largest price
        if(priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // if smallest and largest proces are the same, return a single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else {
        // otherwise , return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }

  }

  String? calculateSalePercenage(double originalPrice,double? salePrice) {

    if(salePrice == null || salePrice <= 0.0) return null;

    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // check product stock status
String getproductStatus(int stock) {
    return stock > 0 ? 'In stock' : 'Out of stock';
}

}