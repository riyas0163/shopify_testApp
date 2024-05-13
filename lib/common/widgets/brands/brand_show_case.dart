import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/features/shop/model/Brand_model.dart';

import '../../../features/shop/screen/Main_Screen/grid_view_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/heloper_functions.dart';
import 'brand_card.dart';

class Tbrandshowcase extends StatelessWidget {
  const Tbrandshowcase({
    super.key, required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundcontainer(
        showborder: true,
        bordercolor: Colors.grey,
        backgroundcolor: Colors.transparent,
        padding: const EdgeInsets.all(Tsizes.sm),
        margin: const EdgeInsets.only(bottom: Tsizes.spacebetweenitems),
        child: Column(
            children: [
             Tbrandcard(showborder: true, brand: BrandModel.empty(),),

        /// brands top 3 product images
        Row(
            children:
            images.map((image) => brandproductimagewidget(image, context)).toList())


    ],
    ),
    );

  }
  Widget brandproductimagewidget(String image, context){
    return Expanded(
      child: TRoundcontainer(
        height: 100,bordercolor: Colors.grey,
        backgroundcolor: THelperfunctions.isdarkmode(context) ? CupertinoColors.darkBackgroundGray : Tcolors.light,
        margin: const EdgeInsets.only(right:  Tsizes.sm),
        padding: const EdgeInsets.all(Tsizes.sm),
        child: Image(fit: BoxFit.contain,image: AssetImage(image),),
      ),
    );


  }
}