import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TRoundedimage extends StatelessWidget {
  const TRoundedimage({
    super.key,
    this.width,
    this.height,
    required this.imageurl,
    this.applyimageradious = true,
    this.border,
    this.backgroundcolor,
    this.fit =  BoxFit.contain,
    this.padding,
    this.insnetworkimage = false,
    this.onpressed,
    this.borderradious = Tsizes.md,

  });

  final double? width,height;
  final String imageurl;
  final bool applyimageradious;
  final BoxBorder? border;
  final Color? backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool insnetworkimage;
  final VoidCallback? onpressed;
  final double borderradious;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,color: backgroundcolor,
          borderRadius:applyimageradious? BorderRadius.circular(borderradious) : BorderRadius.zero,
        ),
        child: ClipRRect(
            borderRadius: applyimageradious ?BorderRadius.circular(Tsizes.md): BorderRadius.zero,
            child: Image(image: insnetworkimage ? NetworkImage(imageurl) : AssetImage(imageurl) as ImageProvider,fit: fit)),

      ),
    );
  }
}


class circularIntegator extends StatelessWidget {
  const circularIntegator({
    super.key,
    this.width = 400,
    this.height = 400,
     this.radius = 400,
     this.padding = 0,
    this.child,
     this.backgroundcolor = Colors.white});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor
      ),
      child: child,
    );
  }
}
















