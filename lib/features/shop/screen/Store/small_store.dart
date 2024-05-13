
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/common/widgets/appbar/appbar_textfield.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/features/shop/control/Brand_controller.dart';
import 'package:shopify/features/shop/control/category_controller.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/features/shop/screen/Store/widgets/category_tab.dart';
import 'package:shopify/features/shop/screen/all_products/brandproducts.dart';
import 'package:shopify/features/shop/screen/brands/all_brands.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../../common/widgets/appbar/Store_tab_bar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class storescreen extends StatelessWidget {
  const storescreen({super.key});

  @override
  Widget build(BuildContext context) {

    final brandcontroller = Get.put(Brandcontroller());
    final categories =  Categorycontroller.instance.featurecategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Appbar_icon(
               // onpressed: () {},
                iconcolor: THelperfunctions.isdarkmode(context) ? Colors.black : Colors.blue,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              // search bar
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                expandedHeight: 450,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(Tsizes.defaultspace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: Tsizes.spacebetweenitems,
                      ),
                      const HomeScreenTextFormField(
                        text: " Search for ",textcolor: Colors.grey,
                        showBorder: true,
                        showbackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: Tsizes.spacebetweenitems,
                      ),

                      // featured brands
                      MultipleSectionHeadings(
                        title: "Featured brands",
                        onpressed: () => Get.to(() => const Allbrands()),
                      ),

                      Obx(
                        () {
                          // if(brandcontroller.isLoading.value)return const CircularProgressIndicator();

                          // if(brandcontroller.feturedBrands.isEmpty){
                          //   return Center(child: Text("No Data Found"),);
                          // }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: brandcontroller.feturedBrands.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 65,
                                crossAxisSpacing: Tsizes.gridviewspacing,
                                mainAxisSpacing: Tsizes.gridviewspacing,
                            ),
                            itemBuilder: (_, index) {
                              final brand = brandcontroller.feturedBrands[index];
                              return  TRoundcontainer(
                                padding: const EdgeInsets.all(Tsizes.sm),
                                showborder: true,
                                backgroundcolor: Colors.transparent,
                                bordercolor: Colors.grey,
                                child: Tbrandcard(showborder: true, brand: brand,ontap: () => Get.to(()=> Brandproducts(brand: brand,)),),);
                            },);
                        },
                      ),
                      const SizedBox(
                        height: Tsizes.spacebetweenitems / 1.5,
                      ),

                      const SizedBox(
                        height: Tsizes.sm,
                      ),

                    ],
                  ),
                ),
                // tab bar section
                bottom:  TTabbar(
                  /// get the home screen list view categories list and map of them
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body:  TabBarView(
            children:  categories.map((category) =>  Tcategorytab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}







