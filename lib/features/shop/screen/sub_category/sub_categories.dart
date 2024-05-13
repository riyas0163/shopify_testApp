import 'package:flutter/material.dart';
import 'package:shopify/common/widgets/images/carosel_image.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/utils/constants/image_strings.dart';
import 'package:shopify/utils/constants/sizes.dart';

import '../../../../common/widgets/product/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports "),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Column(
            children: [
              TRoundedimage(
                imageurl: Timages.banner1,
                height: null,
                width: double.infinity,
                applyimageradious: true,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),

              /// sub categories
              Column(
                children: [
                  MultipleSectionHeadings(
                    title: "Sports Shoes",
                    onpressed: () {},
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: Tsizes.spacebetweenitems,
                            ),
                        itemCount: 4,
                        itemBuilder: (context, index) =>
                            const Tproductscardhorizontal()),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
