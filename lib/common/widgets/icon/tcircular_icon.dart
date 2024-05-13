import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class TCircularicon extends StatelessWidget {
  const TCircularicon({
    super.key,
    this.width,
    this.height,
    this.size = Tsizes.lg,
    this.icon,
    this.color,
    this.backgroundcolor,
    this.onpressed});

  
  final double? width, height,size;
  final IconData? icon;
  final Color? color;
  final Color? backgroundcolor;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundcolor!= null ? backgroundcolor!: THelperfunctions.isdarkmode(context) ? Colors.black.withOpacity(0.9) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onpressed,icon: Icon(icon,color: color,size: size,),),
    );
  }
}





















