import 'package:flutter/material.dart';

class Tproductpricetext extends StatelessWidget {
  const Tproductpricetext({
    super.key,
     this.currenysign = "\$",
    required this.price,
     this.maxlines = 1,
     this.islarge = false,
     this.linerthrough = false
  });

  final String currenysign,price;
  final int maxlines;
  final bool islarge;
  final bool linerthrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currenysign + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: islarge ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: linerthrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(decoration: linerthrough ? TextDecoration.lineThrough : null )
    );
  }
}
