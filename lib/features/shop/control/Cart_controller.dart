import 'package:get/get.dart';
import 'package:shopify/features/shop/control/Variation_controller.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/utils/constants/enums.dart';
import 'package:shopify/utils/local_storage/storage_utility.dart';
import 'package:shopify/utils/popups/loader.dart';

import '../model/Cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    //  loadCartItems();
  }

  // add items in the cart
  void addToCart(ProductModel product) {
    // quantity check
    if (productQuantityCart.value < 1) {
      Tloaders.customtost(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectVariation.value.id.isEmpty) {
      Tloaders.customtost(message: 'Select Variation');
      return;
    }

    // Get stock status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectVariation.value.stock < 1) {
        Tloaders.warningSnackbar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        Tloaders.warningSnackbar(
            title: 'Oh Snap!', message: 'Selected Product is out of stock');
        return;
      }
    }

    // convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityCart.value);

    // check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // this quantity is already or update/remove from the design (cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    Tloaders.customtost(message: 'Your product has been added to the cart');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();

  }

  void removedOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        //remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        Tloaders.customtost(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  ///initialize  already added items in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    // if product has no variations their calculate cartEntries and display total number
    //else make default entries to 0 and show cartEntries when variation is selected

    if(product.productType == ProductType.single.toString()){
      productQuantityCart.value = getProductQuantityInCart(product.id);
    } else{
      // get selected variation if any
      final variationId = variationController.selectVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityCart.value = 0;
      }
    }




  }
  // this function converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      //reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        variationId: variation.id,
        quantity: quantity,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariation: isVariation ? variation.attributeValues : null);
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    Tlocalstorage.instance().writeData('cartItems', cartItemStrings);
  }

  void localCartItems() {
    final cartItemStrings =
        Tlocalstorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
