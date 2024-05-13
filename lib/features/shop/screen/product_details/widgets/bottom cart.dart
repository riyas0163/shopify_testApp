import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/common/widgets/icon/tcircular_icon.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/features/shop/screen/cart/cart.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class Tbottom_add_to_cart extends StatelessWidget {
  const Tbottom_add_to_cart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperfunctions.isdarkmode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Tsizes.defaultspace, vertical: Tsizes.defaultspace),
      decoration: BoxDecoration(
          color: dark ? CupertinoColors.darkBackgroundGray : Tcolors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Tsizes.cardradiouslg),
              topRight: Radius.circular(Tsizes.cardradiouslg))),
      child: Obx(
        () =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Row(
                children: [
                   TCircularicon(
                    height: 40,
                    width: 40,
                    backgroundcolor: Colors.grey,
                    color: Colors.white,
                    icon: Icons.remove,
                    onpressed: ()=>  controller.productQuantityCart.value < 1 ? null : controller.productQuantityCart.value -=1,
                  ),
                  const SizedBox(
                    width: Tsizes.spacebetweenitems,
                  ),
                  Text(
                    controller.productQuantityCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: Tsizes.spacebetweenitems,
                  ),
                   TCircularicon(
                    height: 40,
                    width: 40,
                    backgroundcolor: Colors.blue,
                    color: Colors.black,
                    icon: Icons.add,
                    onpressed: ()=> controller.productQuantityCart.value +=1,
                  ),
                ],
              ),

            ElevatedButton(
                onPressed:  controller.productQuantityCart.value < 1 ? null : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(Tsizes.md),
                    backgroundColor: Colors.black,side: const BorderSide(color: Colors.black)),

                child: const Text("Add to Cart"))
          ],
        ),
      ),
    );
  }
}
