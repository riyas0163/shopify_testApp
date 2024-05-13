import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/control/all_products_controller.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/features/shop/screen/Main_Screen/TGridLayout.dart';

import '../../../../utils/constants/sizes.dart';
import '../product_card_vertical.dart';

class Tsortableproduct extends StatelessWidget {
  const Tsortableproduct({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product sorting
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        // dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          value: controller.selectedSortoption.value,
          onChanged: (value) {
            // sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'popularity',
            'lowest price',
            'Highest price',
            'Newest',
            'sale'
          ]
              .map((Option) => DropdownMenuItem(
                    value: Option,
                    child: Text(Option),
                  ))
              .toList(),
        ),
        SizedBox(
          height: Tsizes.spacebetweensec,
        ),

        Obx(() => TGrid_Layout(
            itemcount: controller.products.length,
            itemBuilder: (_, index) => Verticalproduct(
                  product: controller.products[index],
                )))
        // products
        // GridView.builder(
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemCount: 6,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisExtent: 250,
        //       crossAxisSpacing: Tsizes.gridviewspacing,
        //       // mainAxisSpacing: Tsizes.gridviewspacing
        //     ),
        //     itemBuilder: (_, index) =>  Verticalproduct()),
      ],
    );
  }
}
