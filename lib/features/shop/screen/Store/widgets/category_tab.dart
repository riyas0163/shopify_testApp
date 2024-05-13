import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopify/common/widgets/product/product_card_vertical.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/features/shop/model/category_model.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/features/shop/screen/Main_Screen/TGridLayout.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../control/product_controller.dart';

class Tcategorytab extends StatelessWidget {
  const Tcategorytab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(Tsizes.defaultspace),
            child: Column(
              children: [
                /// brands with product count
                Tbrandshowcase(
                  images: [
                    Timages.img1,
                    Timages.img1,
                    Timages.img1,
                    Timages.img1
                  ],
                ),

                Tbrandshowcase(
                  images: [
                    Timages.img1,
                    Timages.img1,
                    Timages.img1,
                    Timages.img1
                  ],
                ),

                /// products
                MultipleSectionHeadings(
                  title: "you might like",
                  showactionbutton: true,
                  onpressed: () {},
                ),
                const SizedBox(
                  height: Tsizes.spacebetweenitems,
                ),

                // GridView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: 4,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       mainAxisExtent: 250,
                //       crossAxisSpacing: Tsizes.gridviewspacing,
                //       // mainAxisSpacing: Tsizes.gridviewspacing
                //     ),
                //     itemBuilder: (_, index) => const Verticalproduct()),
                // TGrid_Layout(
                //     itemcount: 4,
                //     itemBuilder: (_, index) => Verticalproduct(
                //           product: ProductModel.empty(),
                //         ))


                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  // print(controller.featureProducts);
                  if (controller.featureProducts.isEmpty) {
                    return const Center(
                      child: Text('No data Found'),
                    );
                  }
                  return TGrid_Layout(
                      itemcount: controller.featureProducts.length,
                      itemBuilder: (_, index) => Verticalproduct(
                        product: controller.featureProducts[index],
                      ));
                })
              ],
            ),
          ),
        ]);
  }
}
