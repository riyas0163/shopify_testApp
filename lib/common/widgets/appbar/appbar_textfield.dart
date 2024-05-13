import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/personalization/control/user_controller.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';
import 'package:shopify/features/shop/screen/cart/cart.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';
import 'package:shopify/utils/shimmer/shimmer.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/device/device utility.dart';
import 'app_bar.dart';

class Appbar_icon extends StatelessWidget {
  const Appbar_icon({
    super.key,
    required this.iconcolor,
    //required this.onpressed,
  });

  final Color? iconcolor;

  // final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    // get an instance of the cartcontroller
    final controller = Get.put(CartController());

    return Stack(children: [
      IconButton(
          onPressed: () => Get.to(() => const cartshopify()),
          icon: Icon(
            Icons.shopping_cart,
            color: iconcolor,
            size: 30,
          )),
      Positioned(
        right: 0,
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Tcolors.dark, borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Obx(
              () => Text(
                controller.noOfCartItems.value.toString(),
                style: TextStyle(color: iconcolor),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Tappbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeappbartitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Tcolors.secondary),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const TshimmersEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullname,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: Colors.white),
                );
              }
            },
          )
        ],
      ),
      actions: [
        Appbar_icon(
          // onpressed: () {},
          iconcolor: Colors.white,
        ),
      ],
    );
  }
}

class HomeScreenTextFormField extends StatelessWidget {
  const HomeScreenTextFormField(
      {super.key,
      required this.text,
      this.icon = Icons.search_sharp,
      this.icon1 = Icons.mic,
      this.showbackground = true,
      this.showBorder = true,
      this.ontap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: Tsizes.defaultspace),
      this.textcolor});

  final String text;
  final Color? textcolor;
  final IconData? icon;
  final IconData? icon1;
  final bool showbackground, showBorder;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceutils.getscreenwidth(context),
          padding: const EdgeInsets.all(Tsizes.md),
          decoration: BoxDecoration(
            color: showbackground ? Colors.white : null,
            borderRadius: BorderRadius.circular(Tsizes.cardradiouslg),
            border: showBorder ? Border.all(color: Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Tcolors.dark,
              ),
              const SizedBox(
                width: Tsizes.md,
              ),
              Text(
                text,
                style: TextStyle(
                    color: THelperfunctions.isdarkmode(context)
                        ? Colors.white
                        : Colors.black),
              ),
              // SizedBox(width: Tsizes.buttonwidth,),
              // Icon(icon1,color: Tcolors.dark,),
            ],
          ),
        ),
      ),
    );
  }
}
