import 'package:flutter/material.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class Torderlist extends StatelessWidget {
  const Torderlist({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return ListView.separated(
      shrinkWrap: true,
        separatorBuilder: (_,__)=> const SizedBox(height: Tsizes.spacebetweenitems,),
        itemCount: 10,
      itemBuilder: (_,  index) => TRoundcontainer(
        showborder: true,

        bordercolor: Colors.grey,
        padding: const EdgeInsets.all(Tsizes.sm),
        backgroundcolor: dark ? Colors.black : Colors.white,
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.local_shipping_outlined),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Processing",style: Theme.of(context).textTheme.bodyLarge!.apply(color: Tcolors.primary,fontWeightDelta: 1),),
                  Text("07 april 2024",style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
              trailing: IconButton(onPressed: (){},icon: const Icon(Icons.chevron_right_sharp),),
            ),
            ListTile(
              leading: const Icon(Icons.local_offer_outlined),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order",style: Theme.of(context).textTheme.bodyLarge),
                  Text("[#256fc]",style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
              trailing:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shipping Date",style: Theme.of(context).textTheme.bodyLarge),
                  Text("03 march 2024",style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
            ),
          ],
        ),
      ));
  }
}
