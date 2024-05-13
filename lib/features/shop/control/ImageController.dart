

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/constants/sizes.dart';

class ImageController extends GetxController{
  static ImageController get instance => Get.find();


  /// variables
RxString selectedProductImage = ''.obs;

/// Ge a;; images from product and variations
List<String> getAllProductImages(ProductModel product) {

  /// using set to add unique images only
  Set<String> images ={};

  // load thumbnail images
  images.add(product.thumbnail);

  // assign thumbnail as selected image
  selectedProductImage.value = product.thumbnail;

  // get all the images from products model if not null
  if(product.images != null){
    images.addAll(product.images!);
  }

  // Get all images from the product variations if not null
  if(product.productVariations != null || product.productVariations!.isNotEmpty){
    images.addAll(product.productVariations!.map((variation) => variation.image));
  }
   return images.toList();
}


  /// show image popup
  void showEnlargeImage(String image) {

  Get.to(
    fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Tsizes.defaultspace * 2,horizontal: Tsizes.defaultspace),
              child: CachedNetworkImage(imageUrl: image),
            ),

            SizedBox(height: Tsizes.spacebetweensec,),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: ()=> Get.back(), child: const Text('Close')),
              ),
            )
          ],
        ),
      ),
  );
  }
}
























