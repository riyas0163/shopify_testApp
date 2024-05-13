import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopify/utils/shimmer/shimmer.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/heloper_functions.dart';

class Tcircular_image extends StatelessWidget {
  const Tcircular_image({
    super.key,
    this.fit = BoxFit.fitWidth,
    required this.image,
    this.isnetworkimage = false,
    this.overlaycolor,
    this.backgroundcolor,
    this.width = 35,
    this.height = 40,
    this.padding = Tsizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isnetworkimage;
  final Color? overlaycolor;
  final Color? backgroundcolor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundcolor ??
            (THelperfunctions.isdarkmode(context)
                ? Colors.black
                : Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isnetworkimage
              ? CachedNetworkImage(
              fit: fit,
              color: overlaycolor,
              progressIndicatorBuilder: (context,url ,downloadProgress) => const TshimmersEffect(width: 55, height: 55,radious: 55,),
              imageUrl: image,
            errorWidget: (context, url ,error) => const Icon(Icons.error),
        
          )
              : Image(
                  fit: fit,
                  image: isnetworkimage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlaycolor,
                ),
        ),
      ),
    );
  }
}
