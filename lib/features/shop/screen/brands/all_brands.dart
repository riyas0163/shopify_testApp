import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/common/widgets/brands/brand_card.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/features/shop/control/Brand_controller.dart';
import 'package:shopify/utils/constants/sizes.dart';

import '../Main_Screen/grid_view_container.dart';

class Allbrands extends StatelessWidget {
  const Allbrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandcontroller = Brandcontroller.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brands"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Column(
            children: [
              //heading
              const MultipleSectionHeadings(
                title: "Brands",
                showactionbutton: false,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),

              //Brands
              Obx(
                    () {
                  // if(brandcontroller.isLoading.value)return const CircularProgressIndicator();

                  if(brandcontroller.allBrands.isEmpty){
                    return const Center(child: Text("No Data Found"),);
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: brandcontroller.allBrands.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 65,
                        crossAxisSpacing: Tsizes.gridviewspacing,
                        mainAxisSpacing: Tsizes.gridviewspacing
                    ),
                    itemBuilder: (_, index) {
                      final brand = brandcontroller.allBrands[index];
                      return  TRoundcontainer(
                        padding: const EdgeInsets.all(Tsizes.sm),
                        showborder: true,
                        backgroundcolor: Colors.transparent,
                        bordercolor: Colors.grey,
                        child: Tbrandcard(showborder: true, brand: brand,),);
                    },);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
