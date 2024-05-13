import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/bottom%20cart.dart';

import 'package:shopify/features/shop/screen/product_details/widgets/product_details)image_slider.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/product_meta_data.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/rating_sharewidget.dart';
import 'package:shopify/utils/constants/sizes.dart';

import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../model/product_model.dart';

class Productdetail extends StatelessWidget {
  const Productdetail({super.key,
    required this.product
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Scaffold(
      bottomNavigationBar:  Tbottom_add_to_cart(product: product,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image slider
             TproductsImage_slider(product: product,),

            // product details
            Padding(
              padding: const EdgeInsets.only(
                  right: Tsizes.defaultspace,
                  left: Tsizes.defaultspace,
                  bottom: Tsizes.defaultspace),
              child: Column(
                children: [
                  // rating and share button
                  const Trating_share(),

                  // price, title ,stock , brand
                   Tproductmetadata(product: product,),

                  // // attributes
                  // if(product.productType == ProductType.variable.toString()) TproductAtributes(product: product,),
                  // if(product.productType == ProductType.variable.toString()) const SizedBox(
                  //   height: Tsizes.spacebetweenitems,
                  // ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),


                  // checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Check out"))),
                  // description

                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),
                  const MultipleSectionHeadings(
                    title: "Description",
                    showactionbutton: false,
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),
                   ReadMoreText(
                    product.description! ?? '',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                  ),
                  // reviews
                  const Divider(),
                  const SizedBox(height: Tsizes.spacebetweenitems,),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MultipleSectionHeadings(title: "Reviews  (199)",showactionbutton: false,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                  const SizedBox(height: Tsizes.spacebetweenitems,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
