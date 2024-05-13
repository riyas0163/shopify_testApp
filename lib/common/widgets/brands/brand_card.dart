import 'package:flutter/material.dart';
import 'package:shopify/common/widgets/images/Circular_image.dart';
import 'package:shopify/features/shop/model/Brand_model.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/features/shop/screen/product_details/widgets/brandtitle_withicon.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../utils/constants/sizes.dart';


class Tbrandcard extends StatelessWidget {
  const Tbrandcard({
    super.key,
    required this.showborder,
    this.ontap, required this.brand,
  });
final BrandModel brand;
  final bool showborder;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final isdark = THelperfunctions.isdarkmode(context);
    return GestureDetector(
      onTap: ontap,
      child: TRoundcontainer(
        showborder: showborder,
        backgroundcolor: Colors.transparent,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Tcircular_image(
                  isnetworkimage: true,
              image: brand.image,
              backgroundcolor: Colors.transparent,
              overlaycolor: isdark ? Colors.white : Colors.black,
            )),
            const SizedBox(width: Tsizes.spacebetweenitems ),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Tbrandtitlewithverifyicon(title: brand.name,),
                  Text('${brand.productCount ?? 0} products',overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelMedium,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
