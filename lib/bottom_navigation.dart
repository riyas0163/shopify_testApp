import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/personalization/screen/settings/shopify_settings.dart';
import 'package:shopify/features/shop/screen/Main_Screen/home.dart';
import 'package:shopify/features/shop/screen/Store/small_store.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';
import 'package:shopify/wishlist.dart';

class bottom extends StatelessWidget {
  const bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(Navigationcontroller());
    final darkmode = THelperfunctions.isdarkmode(context);

    return  Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          backgroundColor: darkmode ? Colors.black : Colors.white,
          height: 70,
          elevation: 0,
          indicatorColor: darkmode ? Colors.black : Colors.white,

          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index) => controller.selectedindex.value = index,

          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.store), label: "Store"),
            NavigationDestination(icon: Icon(Icons.favorite_border), label: "Wishlist"),
            NavigationDestination(icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
      body: Obx(()=> controller.screen[controller.selectedindex.value],)
    );
  }
}

class Navigationcontroller extends GetxController{
  final Rx<int> selectedindex = 0.obs;


  final screen = [
      const HomeScreen(), const storescreen(), const wishlist(),const settingsscreen(),
  ];



}














