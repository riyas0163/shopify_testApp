import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';


class TproductAtributes extends StatelessWidget {
  const TproductAtributes({super.key, required this.product});


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Column(
      children: [
        TRoundcontainer(
          padding: const EdgeInsets.all(Tsizes.md),
          backgroundcolor:
              dark ? Colors.grey : CupertinoColors.darkBackgroundGray,
          bordercolor: Colors.grey,
    //       child: Column(
    //         children: [
    //           // title price and stock status
    //     //       Row(
    //     //         children: [
    //     //           const MultipleSectionHeadings(
    //     //             title: "Variation",
    //     //             showactionbutton: false,
    //     //           ),
    //     //           const SizedBox(
    //     //             width: Tsizes.spacebetweenitems,
    //     //           ),
    //     //           Column(
    //     //             crossAxisAlignment: CrossAxisAlignment.start,
    //     //             children: [
    //     //               Row(
    //     //                 children: [
    //     //                   // actual prize
    //     //                   const Text_product_title(
    //     //                     title: "price  :",
    //     //                     smallsize: true,
    //     //                   ),
    //     //                   Text(
    //     //                     "  \$25",
    //     //                     style: Theme.of(context)
    //     //                         .textTheme
    //     //                         .titleSmall!
    //     //                         .apply(decoration: TextDecoration.lineThrough),
    //     //                   ),
    //     //                   const SizedBox(
    //     //                     width: Tsizes.spacebetweenitems,
    //     //                   ),
    //     //
    //     //                   /// sale price
    //     //                   const Tproductpricetext(price: "20")
    //     //                 ],
    //     //               ),
    //     //               Row(
    //     //                 children: [
    //     //                   const Text_product_title(
    //     //                     title: "Stock :",
    //     //                     smallsize: true,
    //     //                   ),
    //     //                   Text(
    //     //                     "In Stock ",
    //     //                     style: Theme.of(context).textTheme.titleMedium,
    //     //                   )
    //     //                 ],
    //     //               )
    //     //             ],
    //     //           )
    //     //         ],
    //     //       ),
    //     //
    //     //
    //     //       const Text_product_title(
    //     //         title:
    //     //             "This the product information it can be going to 4 lines",
    //     //         maxlines: 4,
    //     //         smallsize: true,
    //     //       )
    //     //     ],
    //     //   ),
    //     // ),
    //     // const SizedBox(
    //     //   width: Tsizes.spacebetweenitems,
    //     // ),
    //     // //  attributes
    //     //
    //     // Column(
    //     //   crossAxisAlignment: CrossAxisAlignment.start,
    //     //   children: product.productAttributes!.map((attribute) =>  Column(
    //     //     crossAxisAlignment: CrossAxisAlignment.start,
    //     //     children: [
    //     //        MultipleSectionHeadings(
    //     //         title: attribute.name ?? '',
    //     //         showactionbutton: false,
    //     //       ),
    //     //       const SizedBox(
    //     //         height: Tsizes.spacebetweenitems/ 2,
    //     //       ),
    //     //       Wrap(
    //     //         spacing: 8,
    //     //         children: attribute.values!.map((value) =>   Tchicechips(selected: false, text: value,onselected: (value){},),).toList()
    //     //       )
    //     //
    //     //     ],
    //     //   ),).toList() ,
    //     // ),
    //
    //
    //
    //   ],
    // )
    )
    ]
    );
  }
}


