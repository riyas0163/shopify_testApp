import 'package:flutter/material.dart';

class TBrandtitletext extends StatelessWidget {
  const TBrandtitletext({
    super.key,
    this.color,
    required this.title,
     this.maxlines = 1,
    this.textAlign =TextAlign.center
  });

  final Color? color;
  final String title;
  final int maxlines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,

    );
  }
}
