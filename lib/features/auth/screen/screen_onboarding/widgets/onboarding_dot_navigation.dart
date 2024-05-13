import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/features/auth/control/onbording%20control.dart';
import 'package:shopify/utils/device/device%20utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/sizes.dart';

class onboarding_dot_navigator extends StatelessWidget {
  const onboarding_dot_navigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Onboardingcontroler.instance;
    return Positioned(
        bottom: TDeviceutils.getbottomnavigationbargeight(),
        left: Tsizes.defaultspace,
        child: SmoothPageIndicator(controller:controller.pagecontroller,onDotClicked: controller.dotnavigatorclick, count: 3));
  }
}
