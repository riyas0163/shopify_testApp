import 'package:flutter/material.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../features/shop/screen/Main_Screen/grid_view_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class Tcouponcode extends StatelessWidget {
  const Tcouponcode({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return TRoundcontainer(
      showborder: true,
      backgroundcolor: dark ?Tcolors.dark : Colors.white,

      padding: const EdgeInsets.only(top: Tsizes.sm,bottom: Tsizes.sm,right: Tsizes.sm,left: Tsizes.md),
      child: Row(
        children: [
          Flexible(child: TextFormField(
            decoration: InputDecoration(
                hintText: "Have a promo code? Enter here",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){}, child: const Text("Apply")),
                )
              // border: InputBorder.none,

            ),
          )),
          // button

        ],
      ),
    );
  }
}
