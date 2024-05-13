
import 'package:get/get.dart';
import 'package:shopify/common/widgets/login/login.dart';
import 'package:shopify/common/widgets/order/account_order.dart';
import 'package:shopify/features/auth/screen/forgot_password/forgot_password.dart';
import 'package:shopify/features/auth/screen/screen_onboarding/onboarding.dart';
import 'package:shopify/features/auth/screen/signup_screen/signup.dart';
import 'package:shopify/features/auth/screen/signup_screen/verify_email.dart';
import 'package:shopify/features/personalization/screen/address/address.dart';
import 'package:shopify/features/personalization/screen/profile/edit_profile.dart';
import 'package:shopify/features/personalization/screen/settings/shopify_settings.dart';
import 'package:shopify/features/shop/screen/Main_Screen/home.dart';
import 'package:shopify/features/shop/screen/Store/small_store.dart';
import 'package:shopify/features/shop/screen/cart/cart.dart';
import 'package:shopify/features/shop/screen/checkout/checkout.dart';
import 'package:shopify/routes/routers.dart';
import 'package:shopify/wishlist.dart';

class AppRoutes{
  static final pages =[

    GetPage(name: TRoutes.home, page: ()=> const HomeScreen()),
    GetPage(name: TRoutes.store, page: ()=> const storescreen()),
    GetPage(name: TRoutes.favorites, page: ()=> const wishlist()),
    GetPage(name: TRoutes.settings, page: ()=> const settingsscreen()),
    GetPage(name: TRoutes.order, page: ()=> const Orderscreen ()),
    GetPage(name: TRoutes.checkout, page: ()=> const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: ()=> const cartshopify()),
    GetPage(name: TRoutes.userProfile, page: ()=> const Shopifyprofile ()),
    GetPage(name: TRoutes.userAddress, page: ()=> const useraddress()),
    GetPage(name: TRoutes.signup, page: ()=> const signuppage()),
    GetPage(name: TRoutes.verifyEmail, page: ()=> const Emailverify()),
    GetPage(name: TRoutes.signIn, page: ()=> const login()),
    GetPage(name: TRoutes.forgetPassword, page: ()=> const forgotpassword()),
    GetPage(name: TRoutes.onBoarding, page: ()=> const on()),




  ];
}