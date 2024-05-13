import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/shimmer/shimmer.dart';

class TcategoryShimmer extends StatelessWidget {
  const TcategoryShimmer({
    super.key,
     this.itemcount = 6
  });


  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          separatorBuilder: (_,__)=> const SizedBox(width: Tsizes.spacebetweenitems,),
          itemCount: itemcount,
        itemBuilder: (_,__){
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TshimmersEffect(width: 55, height: 55,radious: 55,),
                SizedBox(height: Tsizes.spacebetweenitems /2,),
                TshimmersEffect(width: 55, height: 8)
              ],
            );
        }
      ),
    );
  }
}
