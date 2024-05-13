import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/shimmer/vertical_shimmers.dart';

import '../../../../common/widgets/product/sortable/sort.dart';
import '../../control/all_products_controller.dart';
import '../../model/product_model.dart';

class Allproducts extends StatelessWidget {
  const Allproducts({super.key, required this.title, this.query, this.futureMethod});

  final  String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;


  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(AllProductController());

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: ( context, snapshot) {

                //check the state of the FutureBuilder snapshot
                const loader = TVerticalProductsShimmer();
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }

                if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No product Found'),);
                }

                if(snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'),);
                }

                /// product found
                final products = snapshot.data!;

                return Tsortableproduct(products: products,);
              },
               ),
        ),
      ),
    );
  }
}


