import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/bottom_navigation.dart';
import 'package:shopify/common/widgets/success_screen/success_screen.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/features/shop/screen/cart/widgets/cart_items.dart';
import 'package:shopify/features/shop/screen/checkout/widgets/billing_address_section.dart';
import 'package:shopify/features/shop/screen/checkout/widgets/billing_amount_section.dart';
import 'package:shopify/features/shop/screen/checkout/widgets/billing_payment_section.dart';
import 'package:shopify/utils/constants/image_strings.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../../common/widgets/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final dark = THelperfunctions.isdarkmode(context);
    return Scaffold(
      appBar: AppBar(
      title: Text(
      "Order Review",
      style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Column(
            children: [
              // items of the card
              const Tcard_items(showAddRemoveButtons: true,),
              const SizedBox(height: Tsizes.spacebetweenitems,),
        
              // coupon textformfield
        
              const Tcouponcode(),
              const SizedBox(height: Tsizes.spacebetweenitems,),
        
              // billing section
              TRoundcontainer(
                showborder: true,
                bordercolor: Colors.grey,
                padding: const EdgeInsets.all(Tsizes.md),
        
                backgroundcolor: dark? Colors.black : Colors.white,
                child: const Column(
                  children: [
                    // pricing
                    Tbillingamountsection(),
                    SizedBox(height: Tsizes.spacebetweenitems,),
                    // divider
                    Divider(),
                    SizedBox(height: Tsizes.spacebetweenitems,),
        
                    // payment method
                    Tbillingpaymentsection(),
                    SizedBox(height: Tsizes.spacebetweenitems,),
                    // address
                    Tbillingaddress()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultspace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(image: Timages.successfull, title: "Payment Success!", subtitle: "Your item will be shipped soon!", onpressed: () => Get.offAll(()=> const bottom()))),child:  Text("Checkout \$ ${controller.totalCartPrice.value}"),),
      ),
    );

  }
}
