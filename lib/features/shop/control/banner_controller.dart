

import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/banners_repository.dart';
import 'package:shopify/features/shop/model/banner_modek.dart';

import '../../../utils/popups/loader.dart';

class BannerController extends GetxController{

/// variables
 final isLoading = false.obs;
  final caroselCurrentindex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatepageindicator(index){
    caroselCurrentindex.value = index;
  }


 @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  /// Fetch banners
  Future<void> fetchBanners() async {
    try {
      // show the loader while loading categories
      isLoading.value = true;

      /// fetch banners
      final bannerRepository = Get.put(BannersRepository());
      final banners = await bannerRepository.fetchBanners(); /// get all the banners

      /// assign banners
      this.banners.assignAll(banners);


    } catch (e) {
      Tloaders.errorSnackbar(title: 'Oh snap',message: e.toString());
    } finally {
      /// stop loading
      isLoading.value = false;
    }
  }






















}