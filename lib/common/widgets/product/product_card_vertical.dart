import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';
import 'package:shopify/features/shop/control/product_controller.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/utils/constants/enums.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';
import '../../../features/shop/model/product_model.dart';
import '../../../features/shop/screen/product_details/product_information.dart';
import '../../../utils/constants/colors.dart';
import '../images/carosel_image.dart';
import '../text/body_text_product_title.dart';
import 'Favorite_icon.dart';

// class Verticalproduct extends StatelessWidget {
//   const Verticalproduct({super.key,
//     required this.product
//   });
//
//    final ProductModel product;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = ProductController.instance;
//     final salePercentage = controller.calculateSalePercenage(product.price, product.salePrice);
//     final dark = THelperfunctions.isdarkmode(context);
//     return GestureDetector(
//       onTap: () => Get.to(()=>  Productdetail()),
//       child: Container(
//        // height: 200,
//         width: 150,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Tsizes.productimageradious),
//           color: dark ? CupertinoColors.darkBackgroundGray : Colors.white,
//         ),
//         child: Column(
//           children: [
//             TRoundcontainer(
//               height: 100,
//               padding: const EdgeInsets.all(Tsizes.sm),
//               backgroundcolor: Colors.grey,
//               child: Stack(
//                   children: [
//                 TRoundedimage(
//
//                   //'https://blog.carts.guru/hubfs/Launch%20a%20New%20Product.png'
//                   imageurl:product.thumbnail,
//                   applyimageradious: true,
//                   insnetworkimage: true,
//                 ),
//                 //     CachedNetworkImage(
//                 //       imageUrl: product.thumbnail,
//                 //       placeholder: (context, url) => CircularProgressIndicator(),
//                 //       errorWidget: (context, url, error) => Icon(Icons.error),
//                 //     ),
//
//
//                // sale tag
//                 TRoundcontainer(
//                   radius: Tsizes.sm,
//                   backgroundcolor: Colors.yellow.withOpacity(0.8),
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Tsizes.sm, vertical: Tsizes.xs),
//                   child: Text(
//                     '$salePercentage',
//                     style: Theme.of(context)
//                         .textTheme
//                         .labelLarge!
//                         .apply(color: Colors.black),
//                   ),
//                 ),
//                 const Positioned(
//                     left: 110,
//                     child: islike_iconbutton(
//                       icon: Icons.favorite,
//                       color: Colors.red,
//                     ))
//               ]),
//             ),
//             const SizedBox(height: Tsizes.spacebetweenitems  / 2,),
//
//
//             // category details
//               Padding(padding: EdgeInsets.only(left: Tsizes.sm),
//             child: Column(mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text_product_title(title:product.title,smallsize: true,),
//                 SizedBox(height: Tsizes.spacebetweenitems  / 2,),
//                 Tbrandtitletext(title: product.brand!.name,),
//               ],
//             ),),
//          //  const Spacer(),
//
//             Row (mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                  Flexible(
//                    child: Column(
//                      children: [
//                      //  if(product.productType == ProductType.single.toString() && product.salePrice> 0)
//                      //     Padding(
//                      //       padding: EdgeInsets.all(8.0),
//                      //       child: Text('Green shoes',style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),
//                      //     ),
//                        Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text('\$ 35',style: TextStyle(fontSize: 20),),),
//                      ],
//                    ),
//                  ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Tcolors.dark,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(Tsizes.cardradiousmd),
//                         bottomRight: Radius.circular(Tsizes.productimageradious),
//                       )
//                   ),
//                   child: SizedBox(
//                     width: Tsizes.iconlg ,
//                     height: Tsizes.iconlg ,
//                     child: const Center(child: Icon(Icons.add,color: Colors.white,),),
//                   ),
//                 )
//               ],
//             )
//           ],
//
//           // details
//         ),
//       ),
//     );
//   }
// }
class Verticalproduct extends StatelessWidget {
  const Verticalproduct({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercenage(product.price, product.salePrice);
    final dark = THelperfunctions.isdarkmode(context);
    return GestureDetector(
      onTap: () => Get.to(() => Productdetail(
            product: product,
          )),
      child: Container(
        // height: 200,
        width: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Tsizes.productimageradious),
          color: dark ? CupertinoColors.darkBackgroundGray : Colors.white,
        ),
        child: Column(
          children: [
            TRoundcontainer(
              height: 100,
              width: 180,
              padding: const EdgeInsets.all(Tsizes.sm),
              backgroundcolor: Colors.grey,
              child: Stack(children: [
                Center(
                  child: TRoundedimage(
                    imageurl: product.thumbnail,
                    applyimageradious: true,
                    insnetworkimage: true,
                  ),
                ),

                // sale tag
                if (salePercentage != null)
                  TRoundcontainer(
                    radius: Tsizes.sm,
                    backgroundcolor: Colors.yellow.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(
                        horizontal: Tsizes.sm, vertical: Tsizes.xs),
                    child: Text(
                      salePercentage,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.white),
                    ),
                  ),
                Positioned(
                    left: 110,
                    child: Tfavoriteicon(
                      productId: product.id,
                    ))
              ]),
            ),
            const SizedBox(
              height: Tsizes.spacebetweenitems / 2,
            ),

            // category details
            Padding(
              padding: const EdgeInsets.only(left: Tsizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text_product_title(
                    title: product.title,
                    smallsize: true,
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems / 2,
                  ),
                  Tbrandtitletext(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),
            //  const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: Tsizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "\$${controller.getProductPrice(product)}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                ProductCartAddToCartButton(
                  product: product,
                )
              ],
            )
          ],

          // details
        ),
      ),
    );
  }
}

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cardcontroller = CartController.instance;

    return InkWell(
      onTap: () {
        // if the product have variations then show the product details for variation selection

        //else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cardcontroller.convertToCartItem(product, 1);
          cardcontroller.addOneToCart(cartItem);
        } else {
          Get.put(Productdetail(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cardcontroller.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? Tcolors.primary : Tcolors.dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Tsizes.cardradiousmd),
                bottomRight: Radius.circular(Tsizes.productimageradious),
              )),
          child: SizedBox(
            width: Tsizes.iconlg,
            height: Tsizes.iconlg,
            child:  Center(
              child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString()) :
              Icon(Icons.add, color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class Tbrandtitletext extends StatelessWidget {
  const Tbrandtitletext({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          width: Tsizes.sm,
        ),
        const Icon(
          Icons.verified,
          color: Colors.blue,
          size: 20,
        )
      ],
    );
  }
}
