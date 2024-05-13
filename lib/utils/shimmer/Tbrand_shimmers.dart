import 'package:flutter/material.dart';
import 'package:shopify/features/shop/screen/Store/grid_layout.dart';

class Tbrandshimmers extends StatelessWidget {
  const Tbrandshimmers({super.key,  this.itemCount = 4});

  final int itemCount;


  @override
  Widget build(BuildContext context) {
    return Tgridlayout(
        mainaxisextent: 80,
        itemcount: itemCount,
        itembuilder: (_,__)=>  const TShimmerEffect(width: 200, height: 80,));
  }
}



class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
     this.radious = 15,
    this.color
  });


  final double width, height, radious;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
