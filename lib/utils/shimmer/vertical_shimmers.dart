
import 'package:flutter/material.dart';
import 'package:shopify/features/shop/screen/Main_Screen/TGridLayout.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/shimmer/shimmer.dart';

class TVerticalProductsShimmer extends StatelessWidget {
  const TVerticalProductsShimmer({super.key,  this.itemcount = 4});

  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return

      TGrid_Layout(itemcount: itemcount,
        itemBuilder: (_,__) => const SizedBox(
          width:  180,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              ///image
              TshimmersEffect(width: 180, height: 150),
              SizedBox(height: Tsizes.spacebetweenitems,),

              /// Text
              TshimmersEffect(width: 160, height: 15),
              SizedBox(height: Tsizes.spacebetweenitems / 2,),
              TshimmersEffect(width: 110, height: 15)
            ],
          ),

        ));


      // GridView.builder(
      // scrollDirection: Axis.vertical,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //
      //   ),
      //   itemCount: itemcount,
      //   itemBuilder: (_,__) => const SizedBox(
      //     width: 180,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         TshimmersEffect(width: 180, height: 180),
      //         SizedBox(height: Tsizes.spacebetweenitems,),
      //
      //         TshimmersEffect(width: 160, height: 15),
      //         SizedBox(height: Tsizes.spacebetweenitems /2,),
      //         TshimmersEffect(width: 130, height: 15)
      //       ],
      //     ),
      //
      //   ));
  }
}

// class TVerticalProductsShimmer extends StatelessWidget {
//   const TVerticalProductsShimmer({required key, this.itemcount = 4}) : super(key: key);
//
//   final int itemcount;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: Tsizes.spacebetweenitems, // Adjust spacing between items vertically
//         crossAxisSpacing: Tsizes.spacebetweenitems, // Adjust spacing between items horizontally
//         childAspectRatio: 180 / 255, // Adjust the aspect ratio as needed
//       ),
//       itemCount: itemcount,
//       itemBuilder: (_, index) => SizedBox(
//         width: 180,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TshimmersEffect(width: 180, height: 180),
//             SizedBox(height: Tsizes.spacebetweenitems),
//             TshimmersEffect(width: 160, height: 15),
//             SizedBox(height: Tsizes.spacebetweenitems / 2),
//             TshimmersEffect(width: 130, height: 15),
//           ],
//         ),
//       ),
//     );
//   }
// }



