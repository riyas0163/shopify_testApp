import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../control/Cart_controller.dart';

class Tbillingamountsection extends StatelessWidget {
  const Tbillingamountsection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Column(
      children: [
        // sub total
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$  ${controller.totalCartPrice.value}",style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: Tsizes.spacebetweenitems,),
        // tax fee
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$0.0",style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: Tsizes.spacebetweenitems,),

        // order total
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order total",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${controller.totalCartPrice.value}",style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}