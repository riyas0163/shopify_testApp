import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';


class Tgridlayout extends StatelessWidget {
  const Tgridlayout({super.key,
    required this.itemcount,
    this.mainaxisextent,
    required this.itembuilder});

  final int itemcount;
  final double? mainaxisextent;
  final Widget? Function(BuildContext , int ) itembuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        mainAxisExtent: mainaxisextent,
          mainAxisSpacing: Tsizes.gridviewspacing,
          crossAxisSpacing: Tsizes.gridviewspacing
        ),
        itemCount: itemcount,
        itemBuilder: itembuilder,
    );
  }
}
