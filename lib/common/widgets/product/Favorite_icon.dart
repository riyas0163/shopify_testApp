import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/control/FavouriteController.dart';
import '../icon/tcircular_icon.dart';

class Tfavoriteicon extends StatelessWidget {
  const Tfavoriteicon({super.key, required this.productId});

  final  String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () =>  TCircularicon(

        backgroundcolor: Colors.black12,
        icon:controller.isFavourite(productId) ? Icons.favorite : Icons.favorite_border,
        color: controller.isFavourite(productId) ?Colors.red : Colors.transparent,
        onpressed: ()=> controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
