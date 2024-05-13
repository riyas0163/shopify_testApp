//
// import 'package:flutter/material.dart';
//
// import '../../../../utils/constants/sizes.dart';
//
// class TGridLayout extends StatelessWidget {
//   const TGridLayout({
//     super.key,
//     required this.itemcount,
//     this.mainAxisExtent = 288,
//
//   });
//
//
//
//   final double? mainAxisExtent;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: itemcount,
//         padding: EdgeInsets.zero,physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: mainAxisExtent,mainAxisSpacing: Tsizes.gridviewspacing,crossAxisSpacing: Tsizes.gridviewspacing), itemBuilder: itemBuilder);
//   }
// }


import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/sizes.dart';

class TGrid_Layout extends StatelessWidget {
  const TGrid_Layout({
    super.key, required this.itemcount, required this.itemBuilder,
   // required this.controller,
  });

 // final ProductController controller;

  final int itemcount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:itemcount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
          crossAxisCount: 2,
          mainAxisExtent: 240,
          crossAxisSpacing: Tsizes.gridviewspacing,
          // mainAxisSpacing: Tsizes.gridviewspacing
        ),

        itemBuilder: itemBuilder);
  }
}