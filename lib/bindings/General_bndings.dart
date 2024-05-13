
import 'package:get/get.dart';
import 'package:shopify/features/auth/control/network_manager.dart';
import 'package:shopify/features/shop/control/Variation_controller.dart';

class Generalbindings extends Bindings{

  @override
  void dependencies() {
    Get.put(Networkmanager());
    Get.put(VariationController());
  }
}