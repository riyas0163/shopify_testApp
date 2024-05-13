import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';

import '../../../../../common/widgets/cart/cart_add_remove_button.dart';
import '../../../../../common/widgets/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../product_details/widgets/product_price_text.dart';

class Tcard_items extends StatelessWidget {
  const Tcard_items({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return  Obx(
      () => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
                final item = controller.cartItems[index];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Tcartitems(
                        cartItem: item,
                      ),
                      if (showAddRemoveButtons)
                        const SizedBox(
                          height: Tsizes.spacebetweenitems,
                        ),
                      if (showAddRemoveButtons)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                ),
                                // add and remove button
                                TproductQuantityaddRemove(
                                  quantity: item.quantity,
                                  add: () => controller.addOneToCart(item),
                                  remove: () =>
                                      controller.removedOneFromCart(item),
                                ),
                              ],
                            ),
                            Tproductpricetext(price:(item.price * item.quantity).toStringAsFixed(1))
                          ],
                        )
                    ],
                  ),
                );
              })),
    );
  }
}
