import 'package:flutter/material.dart';
import 'package:shopify/features/shop/model/Cart_item_model.dart';

import '../../../features/shop/screen/product_details/widgets/Tproduct_title_text.dart';
import '../../../features/shop/screen/product_details/widgets/brandtitle_withicon.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../images/carosel_image.dart';

class Tcartitems extends StatelessWidget {
  const Tcartitems({
    super.key, required this.cartItem,
  });


  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TRoundedimage(
        imageurl: cartItem.image ?? '',
        insnetworkimage: true,
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(Tsizes.sm),
      ),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tbrandtitlewithverifyicon(title: cartItem.brandName ?? '',),
          Tproducttitle(title: cartItem.title,),
        ],
      ),
      subtitle: Text.rich(
          TextSpan(
              children: (cartItem.selectedVariation ?? {}).entries.map((e) =>
                  TextSpan(
                      children: [
                        TextSpan(text: '${e.key}', style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall),
                        TextSpan(text: '${e.key}', style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge),

                      ]
                  )).toList(),

          )
      ),

    );
  }
}