import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class TshimmersEffect extends StatelessWidget {
  const TshimmersEffect({
  super.key,
  required this.width, 
  required this.height,
   this.radious = 25, 
   this.color
  });

  final double width,height, radious;
  final Color? color;
  
  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]! , 
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? (dark ? Colors.grey : Colors.white),
          borderRadius: BorderRadius.circular(radious)
        ),
      ),
    );
  }
}
