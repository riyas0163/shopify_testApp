import 'package:flutter/material.dart';
import 'package:shopify/common/widgets/brands/brand_card.dart';
import 'package:shopify/common/widgets/product/sortable/sort.dart';
import 'package:shopify/features/shop/control/Brand_controller.dart';
import 'package:shopify/features/shop/model/Brand_model.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/Cloud_helper_function.dart';
import 'package:shopify/utils/shimmer/vertical_shimmers.dart';

class Brandproducts extends StatelessWidget {
  const Brandproducts({super.key, required this.brand});

  final BrandModel brand;


  @override
  Widget build(BuildContext context) {
    final controller = Brandcontroller.instance;
    return Scaffold(
      appBar: AppBar(
        title:  Text(brand.name),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Column(
            children: [
              Tbrandcard(showborder: true, brand: brand,),
              const SizedBox(height: Tsizes.spacebetweenitems,),

              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
              builder: ( context,snapshot) {

                    /// handle loader , no record , or error message
                    const loader = TVerticalProductsShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                    if(widget != null) return widget;

                    /// record found
                  final brandproductrs = snapshot.data!;
                    return  Tsortableproduct(products: brandproductrs,);
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}
