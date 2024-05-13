import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/screen/all_products/all_products.dart';
import '../../../../common/custom_shaps/circular_container/primary_header_container.dart';
import '../../../../common/widgets/appbar/appbar_textfield.dart';
import '../../../../common/widgets/product/product_card_vertical.dart';
import '../../../../common/widgets/text/category_text_widget.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../control/product_controller.dart';
import 'TGridLayout.dart';
import 'carosel_slider_indicator_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryCurvedWidget(
              child: Column(
                children: [
                  // app bar icon and text
                  const AppBarText(),
                  // search bar
                  const HomeScreenTextFormField(
                    text: 'Search in Store',
                  ),

                  SizedBox(
                    height: Tsizes.spacebtwinputfields,
                  ),

                  // categories and headings
                  const Padding(
                    padding: EdgeInsets.only(left: Tsizes.defaultspace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // headings
                        MultipleSectionHeadings(
                          title: 'Popular Categories',
                          showactionbutton: false,
                        ),
                        SizedBox(
                          height: Tsizes.spacebetweenitems,
                        ),
                        //categories
                        listview_categeries(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Tsizes.spacebetweensec,
                  )
                ],
              ),
            ),
            // body section carousel slider
            const carosel_slider_indicator(),

            // headings
            body_heading(
              title: 'Popular products',
              onpressed: () => Get.to(() => Allproducts(
                    title: 'Popular Products',
                   // query: FirebaseFirestore.instance.collection('Products').where('IsFeeatured', isEqualTo: true).limit(6),
                  /// future method any values come out or else before query method loop
                    futureMethod: controller.fetchAllFeatureProducts(),
                  )),
            ),

            ///products
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              // print(controller.featureProducts);
              if (controller.featureProducts.isEmpty) {
                return const Center(
                  child: Text('No data Found'),
                );
              }
              return TGrid_Layout(
                  itemcount: controller.featureProducts.length,
                  itemBuilder: (_, index) => Verticalproduct(
                        product: controller.featureProducts[index],
                      ));
            })
          ],
        ),
      ),
    );
  }
}
