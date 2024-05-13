import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/sizes.dart';

class TRoundcontainer extends StatelessWidget {
  const TRoundcontainer({
    super.key,
    this.width ,
    this.height,
    this.child,
    this.showborder = false,
    this.bordercolor = Colors.white,
    this.backgroundcolor = Colors.grey,
    this.padding,
    this.margin,
    this.radius = Tsizes.cardradiouslg,
    this.onpressed});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showborder;
  final Color bordercolor;
  final Color backgroundcolor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: showborder ? Border.all(color: bordercolor) : null,
        ),
        child: child,
      ),
    );
  }
}
