

import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/product_repository.dart';
import 'package:shopify/features/shop/model/Brand_model.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../../../data/repositories/repository_authetication/Brand_repository.dart';

class Brandcontroller extends GetxController {
  static Brandcontroller get instance => Get.find();


  RxBool isLoading = true.obs;
  final RxList<BrandModel> feturedBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandrepository = Get.put(BrandRepository());


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFeaturedBrands();
  }

  /// load Brands
  Future<void> getFeaturedBrands() async {
    ///cloud cury means try catch method
    try {
      // show the loader while loading brands
      isLoading.value = true;

      final brands = await brandrepository.getAllbrands();

      allBrands.assignAll(brands);

      feturedBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      Tloaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// Get  brands for category


  /// Get brand specific products from your data source

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      Tloaders.errorSnackbar(title: 'oh snap!', message: e.toString());
      return [];
    }
  }

}