import 'package:get/get.dart';
import 'package:shopify/features/shop/control/Cart_controller.dart';
import 'package:shopify/features/shop/control/ImageController.dart';
import 'package:shopify/features/shop/model/product_model.dart';

import '../model/ProductVariation_Model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// variables
  RxMap selectedAttributes = {}.obs;
  RxString variationstatus = ''.obs;
  Rx<ProductVariationModel> selectVariation = ProductVariationModel.empty().obs;

  ///select attribute and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    //show the selected variation image as a main image
    if (selectVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectVariation.image;
    }

    // show the selected variation image as a main image
    if(selectVariation.id.isNotEmpty){
      final cartcontroller = CartController.instance;
      cartcontroller.productQuantityCart.value = cartcontroller.getVariationQuantityInCart(product.id,selectVariation.id);
    }

    // assign the selected variation
    this.selectVariation.value = selectVariation;
  }

  /// check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    //if selectedAttributes contains 3 attributes and current variation contain 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return
    for (final key in variationAttributes.keys) {
      // attributes[key] != values which could be [Green,small,cotton].etc
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// check attribute availability / stock in variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {

    // pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations.where((variation) => variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0 )
    // fetch all non-empty attributes of variations
    .map((variation) => variation.attributeValues[attributeName] ).toSet();

return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectVariation.value.salePrice > 0? selectVariation.value.salePrice : selectVariation.value.price).toString();
  }

  /// Check product variation stock status
  void getProductVariationStatus() {
    variationstatus.value =
        selectVariation.value.stock > 0 ? 'In Stock' : 'Out of stock';
  }

  /// reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationstatus.value = '';
    selectVariation.value = ProductVariationModel.empty();
  }
}
