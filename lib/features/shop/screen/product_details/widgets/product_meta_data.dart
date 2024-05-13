import 'package:flutter/material.dart';
import 'package:shopify/features/shop/control/product_controller.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/Tproduct_title_text.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/brandtitle_withicon.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/product_price_text.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/constants/enums.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../Main_Screen/grid_view_container.dart';

class Tproductmetadata extends StatelessWidget {
  const Tproductmetadata({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercenage(product.price, product.salePrice);
       return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // price  and sale price
        Row(
          children: [

            TRoundcontainer(
              radius: Tsizes.sm,
              backgroundcolor: Tcolors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: Tsizes.sm, vertical: Tsizes.xs),
              child: Text(
                "$salePercentage %",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.black),
              ),
            ),
            const SizedBox(width: Tsizes.spacebetweenitems,),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text("\$$salePercentage",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: Tsizes.spacebetweenitems,),
             Tproductpricetext(price: controller.getProductPrice(product),islarge: true,)
          ],
        ),
        // title
         Tproducttitle(title: product.title),
        const SizedBox(width: Tsizes.spacebetweenitems,),

        // stock status
        Row(
          children: [
             const Tproducttitle(title: "Status "),
            const SizedBox(width: Tsizes.spacebetweenitems,),
            Text(controller.getproductStatus(product.stock),style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),

        const SizedBox(width: Tsizes.spacebetweenitems,),


        // brands
        // before add image for icon
         Tbrandtitlewithverifyicon(title:product.brand != null ? product.brand!.name : '' ,),


      ],
    );
  }
}
