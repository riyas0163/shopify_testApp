import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/categories_repository.dart';
import 'package:shopify/features/shop/model/category_model.dart';
import 'package:shopify/utils/popups/loader.dart';

class Categorycontroller extends GetxController {
  static Categorycontroller get instance => Get.find();


  final _categoryrepository = Get.put(Categoryrepository());
  RxList<CategoryModel> allcategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featurecategories = <CategoryModel>[].obs;///
  final isLoading = false.obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// load category data
Future<void> fetchCategories() async {
    try {
      // show the loader while loading categories
       isLoading.value = true;

      // fetch categories from data source (firebase)
      final categories = await _categoryrepository.getAllcategories();

      // update the categories list
      allcategories.assignAll(categories);


      //  filter featured category
      featurecategories.assignAll(allcategories.where((category) => category.isFeatured && category.parentid.isEmpty).take(8).toList());
      ///  get the all category data from using the parentid get top 8 category assign all the categories to featurecategories

    } catch (e) {
      Tloaders.errorSnackbar(title: 'Oh snap',message: e.toString());
    } finally {
      /// stop loading
      isLoading.value = false;
    }
}


  /// load selected category data


  /// get category or sub category products
}