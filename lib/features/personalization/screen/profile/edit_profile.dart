import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/common/widgets/images/Circular_image.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/features/personalization/control/user_controller.dart';
import 'package:shopify/features/personalization/screen/change_name.dart';
import 'package:shopify/utils/constants/image_strings.dart';
import 'package:shopify/utils/shimmer/shimmer.dart';

import '../../../../utils/constants/sizes.dart';
import 'edit_profile_menu.dart';

class Shopifyprofile extends StatelessWidget {
  const Shopifyprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController.instance);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),

          // profile picture
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkimage = controller.user.value.profilePicture;
                      final image = networkimage.isNotEmpty
                          ? networkimage
                          : Timages.google;

                      return controller.imageloader.value
                          ? const TshimmersEffect(
                              width: 80,
                              height: 80,
                              radious: 80,
                            )
                          : Tcircular_image(
                              height: 80,
                              width: 80,
                              image: image,
                              isnetworkimage: networkimage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadProfilePictiure(),
                        child: const Text("Change profile picture"))
                  ],
                ),
              ),

              // details
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              const Divider(),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              const MultipleSectionHeadings(
                title: "Profile information",
                showactionbutton: false,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),

              profile_menu(
                onpressed: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullname,
              ),
              profile_menu(
                onpressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const Divider(),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              const MultipleSectionHeadings(
                title: "Personal information",
                showactionbutton: false,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),

              profile_menu(
                onpressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Icons.copy,
              ),
              profile_menu(
                onpressed: () {},
                title: 'Email ',
                value: controller.user.value.email,
              ),
              profile_menu(
                onpressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phonenumber,
              ),
              profile_menu(
                onpressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              profile_menu(
                onpressed: () {},
                title: 'Date of Birth',
                value: '17 aug,2001',
              ),
              const Divider(),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteWarningPopup(),
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

