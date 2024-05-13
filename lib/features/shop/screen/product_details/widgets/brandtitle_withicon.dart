import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/sizes.dart';

import 'T_brand_title_text.dart';

class Tbrandtitlewithverifyicon extends StatelessWidget {
  const Tbrandtitlewithverifyicon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textcolor,
    this.iconcolor ,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final int maxlines;
  final Color? textcolor, iconcolor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: TBrandtitletext(
          title: title,
          color: textcolor,
          maxlines: maxlines,
          textAlign: textAlign,
        )),
        const SizedBox(width: Tsizes.sm,),
        Icon(Icons.verified,color: iconcolor,size: Tsizes.iconmd,)
      ],
    );
  }
}
