import 'package:flutter/material.dart';

class Text_product_title extends StatelessWidget {
  const Text_product_title({
    super.key,
    required this.title,
     this.smallsize = false,
     this.maxlines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallsize;
  final int maxlines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:smallsize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.labelSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textAlign);
  }
}