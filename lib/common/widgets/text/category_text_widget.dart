import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/control/category_controller.dart';
import 'package:shopify/features/shop/screen/sub_category/sub_categories.dart';
import 'package:shopify/utils/shimmer/category_shimmers.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/shimmer/shimmer.dart';

class vertical_images extends StatelessWidget {
  const vertical_images({
    super.key,
    required this.image,
    required this.title,
    this.textcolor = Colors.white,
    this.backgroundcolor,
    this.ontap,
    this.inNetworkimage = true,
    this.fit, this.overlaycolor,
  });

  final String image, title;
  final BoxFit? fit;
  final Color textcolor;
  final Color? backgroundcolor;
  final void Function()? ontap;
  final bool inNetworkimage;
  final Color? overlaycolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: Tsizes.spacebetweenitems),
        child: Column(
          
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: inNetworkimage
                        ? CachedNetworkImage(
                      fit: fit,
                      color: overlaycolor,
                      progressIndicatorBuilder: (context,url ,downloadProgress) => const TshimmersEffect(width: 55, height: 55,radious: 55,),
                      imageUrl: image,
                      errorWidget: (context, url ,error) => const Icon(Icons.error),
                
                    )
                        : Image(
                      fit: fit,
                      image: inNetworkimage
                          ? NetworkImage(image)
                          : AssetImage(image) as ImageProvider,
                      color: overlaycolor,
                    ),
                  ),
                ),
              ),
          // Container(
          //   height: 50,
          //   width: 50,
          //   padding: EdgeInsets.all(Tsizes.fontsizesm),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(image),
          //         fit: BoxFit.fill,
          //       ),
          //       color: backgroundcolor,
          //       borderRadius: BorderRadius.circular(100)),
          // ),
             // Tcircular_image(image: image,fit: BoxFit.fitWidth,padding: Tsizes.sm *1.4, backgroundcolor: backgroundcolor,),
          const SizedBox(
            height: Tsizes.spacebetweenitems / 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
                width: 60,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textcolor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          )
        ]),
      ),
    );
  }
}

class listview_categeries extends StatelessWidget {
  const listview_categeries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(Categorycontroller());

    return Obx(() {
      if (categoryController.isLoading.value) return const TcategoryShimmer();
      // print(categoryController.featurecategories);
      if (categoryController.featurecategories.isEmpty) {
        return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
        ));
      } else {
        return SizedBox(
          height: 80,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featurecategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featurecategories[index];
                return vertical_images(
                  image: category.image,
                  title: category.name,
                  ontap: () => Get.to(() => const SubCategoriesScreen()),
                );
              }),
        );
      }

    });
  }
}
