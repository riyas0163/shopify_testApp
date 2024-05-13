import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopify/bottom_navigation.dart';
import 'package:shopify/common/widgets/loaders/animation_loader.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';
import 'package:shopify/features/shop/screen/cart/widgets/cart_items.dart';
import 'package:shopify/features/shop/screen/checkout/checkout.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class cartshopify extends StatelessWidget {
  const cartshopify({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        //nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Oh Cart is Empty',
          animation: Timages.run1,
          showAction: true,
          actionText: 'Lets fill it',
          onactionpressed: () => Get.off(() => const bottom()),
        );

        return controller.cartItems.isEmpty
            ? emptyWidget
            : Padding(
              padding: EdgeInsets.all(Tsizes.defaultspace),
              child: Tcard_items(),
            );
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(Tsizes.defaultspace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() =>
                    Text("Checkout \$${controller.totalCartPrice.value}")),
              ),
            ),
    );
  }
}
