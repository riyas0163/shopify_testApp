import 'package:flutter/material.dart';


class Tproducttitle extends StatelessWidget {
  const Tproducttitle({
    super.key,
    required this.title,
     this.smallsize = false,
     this.maxlines = 2,
    this.textAlign = TextAlign.left
  });


  final String title;
  final bool smallsize;
  final int maxlines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallsize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textAlign,
    );
  }
}
