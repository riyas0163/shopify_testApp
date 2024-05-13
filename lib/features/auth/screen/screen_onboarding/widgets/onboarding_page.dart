import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopify/common/widgets/login/login.dart';
import 'package:shopify/features/auth/control/onbording%20control.dart';
import 'package:shopify/utils/device/device%20utility.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/heloper_functions.dart';

class onboarding_skip extends StatelessWidget {
  const onboarding_skip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceutils.getappbargeight(),
        right: Tsizes.defaultspace,
        child: TextButton(
          onPressed: () =>Onboardingcontroler.instance.skippage(),
          child: const Text("Skip",style: TextStyle(fontSize: 18),),
        ));
  }
}

class onboarding_page extends StatelessWidget {
  const onboarding_page({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image(
              height: THelperfunctions.screenheight() * 0.5,
              width: THelperfunctions.screenwidth() * 0.9,
              image: AssetImage(
                image,
              )),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}


class Elevated_button extends StatelessWidget {
  const Elevated_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: Tsizes.defaultspace,
        bottom: TDeviceutils.getbottomnavigationbargeight(),
        child: ElevatedButton(onPressed: () => Get.to(const login()),
          child: const Icon(Icons.arrow_forward_ios_sharp),));
  }
}