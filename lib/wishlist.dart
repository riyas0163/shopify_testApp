import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/bottom_navigation.dart';
import 'package:shopify/common/widgets/loaders/animation_loader.dart';
import 'package:shopify/features/shop/control/FavouriteController.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/features/shop/screen/Main_Screen/TGridLayout.dart';
import 'package:shopify/features/shop/screen/Main_Screen/home.dart';
import 'package:shopify/utils/constants/image_strings.dart';
import 'package:shopify/utils/helpers/Cloud_helper_function.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';
import 'package:shopify/utils/shimmer/vertical_shimmers.dart';

import 'common/widgets/product/product_card_vertical.dart';


class wishlist extends StatelessWidget {
  const wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist",style: Theme.of(context).textTheme.headlineMedium,),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () => Get.to(const HomeScreen()), icon: Icon(Icons.add,color: THelperfunctions.isdarkmode(context) ? Colors.white : Colors.black,)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 4,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisExtent: 250,
              //       crossAxisSpacing: Tsizes.gridviewspacing,
              //       // mainAxisSpacing: Tsizes.gridviewspacing
              //     ),
              //     itemBuilder: (_, index) =>  Verticalproduct()),
              Obx(
              ()=>  FutureBuilder(future: controller.favoriteProducts(),
                builder: ( context, snapshot) {

                  final emptywidget = Center(
                    child: TAnimationLoaderWidget(
                        text: 'Wishlist is empty',
                        animation: Timages.run1,
                      showAction: true,
                      actionText: 'Let\'s add one',
                      onactionpressed: () => Get.off(()=> const bottom()),
                    ),
                  );

                  const loader = TVerticalProductsShimmer(itemcount: 4,);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptywidget);
                  if(widget != null) return widget;

                  final products = snapshot.data!;
                  return TGrid_Layout(
                      itemcount: products.length,
                      itemBuilder: (_,index) => Verticalproduct(product: products[index],));
                }, ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
