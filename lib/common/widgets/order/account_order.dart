import 'package:flutter/material.dart';
import 'package:shopify/common/widgets/order/widget/orderlist_items.dart';
import 'package:shopify/utils/constants/sizes.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(Tsizes.defaultspace),

        // Orderes
        child: Torderlist(),
      ),
    );
  }
}
