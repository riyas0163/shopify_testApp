

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/personalization/screen/address/add_new_address.dart';
import 'package:shopify/features/personalization/screen/address/single_address.dart';
import 'package:shopify/utils/constants/colors.dart';

class useraddress extends StatelessWidget {
  const useraddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const addnewaddress()),
        backgroundColor: Tcolors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text("Address",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Singleaddress(selectedaddress: false),
            Singleaddress(selectedaddress: true),
            Singleaddress(selectedaddress: false),
            Singleaddress(selectedaddress: false),
            Singleaddress(selectedaddress: false),
          ],
        ),
      ),
    );
  }
}
