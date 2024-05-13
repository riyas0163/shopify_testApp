import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/control/ImageController.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../../../common/custom_shaps/circular_container/curved_container_widget.dart';
import '../../../../../common/widgets/appbar/app_bar.dart';
import '../../../../../common/widgets/images/carosel_image.dart';
import '../../../../../common/widgets/product/Favorite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TproductsImage_slider extends StatelessWidget {
  const TproductsImage_slider({
    super.key,
    required this.product,
  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return curved_Edges(
      child: Container(
        color: dark ? CupertinoColors.darkBackgroundGray : Tcolors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(Tsizes.productimageradious * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      /// get an enlarged particular image
                      onTap: () => controller.showEnlargeImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  })),
                )),

            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: Tsizes.defaultspace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: Tsizes.spacebetweenitems,
                  ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return TRoundedimage(
                        insnetworkimage: true,
                        width: 80,
                        backgroundcolor: dark ? Tcolors.dark : Colors.white,
                        border: Border.all(
                            color: imageSelected
                                ? Colors.red
                                : Colors.transparent),
                        padding: const EdgeInsets.all(Tsizes.sm),
                        imageurl: images[index],
                    
                    // selected images show in big screen 
                    onpressed: () => controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
              ),
            ),

            // appbar icon
             Tappbar(
              showbackarrow: true,
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Tfavoriteicon(productId: product.id,)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
