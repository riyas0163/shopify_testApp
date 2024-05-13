import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/common/widgets/appbar/app_bar.dart';
import 'package:shopify/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:shopify/common/widgets/login/login.dart';
import 'package:shopify/common/widgets/order/account_order.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/features/personalization/screen/address/address.dart';
import 'package:shopify/features/personalization/screen/profile/edit_profile.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../../common/custom_shaps/circular_container/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/user_profile.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screen/cart/cart.dart';

class settingsscreen extends StatelessWidget {
  const settingsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryCurvedWidget(
              child: Column(
                children: [
                  Tappbar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),

                  // user profile card
                  Tuserprofile(onpressed: () => Get.to(const Shopifyprofile()),),
                  SizedBox(
                    height: Tsizes.spacebetweensec,
                  )
                ],
              ),
            ),

            // body section
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultspace),
              child: Column(
                children: [
                  MultipleSectionHeadings(
                    title: "Account settings",
                    showactionbutton: false,
                    textcolor: THelperfunctions.isdarkmode(context) ? Colors.white : Colors.black,
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),
                  Tsettingsmenutitle(
                    icon: Icons.home,
                    title: "My address",
                    subtitle: "Set shopping delivery address",
                    ontap: ()=> Get.to(()=> const  useraddress()),
                  ),
                  Tsettingsmenutitle(
                    ontap: () => Get.to(()=> const cartshopify()),
                    icon: Icons.shopping_bag_outlined,
                    title: "My cart",
                    subtitle: "Add , remove products and move to checkout",
                  ),
                  Tsettingsmenutitle(
                    ontap: ()=>Get.to(()=>const Orderscreen(),) ,
                    icon: Icons.shopping_basket_outlined,
                    title: "My Orders",
                    subtitle: "In progress and completed Orders",
                  ),
                  const Tsettingsmenutitle(
                    icon: Icons.comment_bank_outlined,
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                  ),
                  const Tsettingsmenutitle(
                    icon: Icons.local_offer_outlined,
                    title: "My Coupons",
                    subtitle: "List of all the discounted coupons",
                  ),
                  const Tsettingsmenutitle(
                    icon: Icons.alarm,
                    title: "Notifications",
                    subtitle: "Set any kind of notifications message",
                  ),
                  const Tsettingsmenutitle(
                    icon: Icons.safety_check_outlined,
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),
                  const MultipleSectionHeadings(
                    title: "App settings",
                    showactionbutton: false,
                  ),
                  const SizedBox(
                    height: Tsizes.spacebetweenitems,
                  ),
                  const Tsettingsmenutitle(
                    icon: Icons.file_copy_outlined,
                    title: "Load Data",
                    subtitle: "Upload Data to youe Cloud firebase",
                  ),
                  Tsettingsmenutitle(
                    icon: Icons.location_on_rounded,
                    title: "Geo Location",
                    subtitle: "Set recommandation based on location",
                    trailing: Switch(value: true,onChanged: (value){},),
                  ),
                  Tsettingsmenutitle(
                    icon: Icons.security,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(value: false,onChanged: (value){},),
                  ),
                  Tsettingsmenutitle(
                    icon: Icons.image,
                    title: "HD Image quality ",
                    subtitle: "Set Image quality to be seen",
                    trailing: Switch(value: false,onChanged: (value){},),
                  ),
                  const SizedBox(height: Tsizes.spacebetweenitems,),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: () => Get.to(()=> const login()), child: const Text("Logout"))),
                  SizedBox(height: Tsizes.spacebetweensec,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
