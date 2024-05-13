import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/common/widgets/images/carosel_image.dart';
import 'package:shopify/common/widgets/text/body_text_product_title.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/brandtitle_withicon.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/product_price_text.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/constants/image_strings.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../utils/constants/sizes.dart';
import 'Favorite_icon.dart';

class Tproductscardhorizontal extends StatelessWidget {
  const Tproductscardhorizontal({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Container(
      // height: 200,
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Tsizes.productimageradious),
        color: dark ? CupertinoColors.darkBackgroundGray : Tcolors.lightcontainer,
      ),
      child: Row(
        children: [
          // thumbnail
          TRoundcontainer(
            height: 120,
            padding: const EdgeInsets.all(Tsizes.sm),
            backgroundcolor: dark ? Tcolors.dark : Tcolors.light,
            child: Stack(
              children: [
                SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedimage(
                      imageurl: Timages.banner1,
                      applyimageradious: true,
                    )),

                // sale tag
                Positioned(
                    child: TRoundcontainer(
                  radius: Tsizes.sm,
                  backgroundcolor: Tcolors.secondary,
                  padding: EdgeInsets.symmetric(
                      horizontal: Tsizes.sm, vertical: Tsizes.xs),
                  child: Text(
                    "25",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.black),
                  ),
                )),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: Tfavoriteicon(productId: '',)
                )
              ],
            ),
          ),
          // details
           SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Tsizes.sm,left: Tsizes.sm),
              child: Column(
                children: [
                const   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text_product_title(title: "Green Nike half sleeves shirt",smallsize: true,),
                      SizedBox(height: Tsizes.spacebetweenitems/2,),
                      Tbrandtitlewithverifyicon(title: "Nike"),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // pricing
                       const Flexible(child: Tproductpricetext(price: "256.0 -\$256470.1")),

                      // add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: Tcolors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Tsizes.cardradiousmd),
                            bottomRight: Radius.circular(Tsizes.productimageradious),
                          )
                        ),
                        child: SizedBox(
                          width: Tsizes.iconlg ,
                          height: Tsizes.iconlg ,
                          child: const Center(child: Icon(Icons.add,color: Colors.white,),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
