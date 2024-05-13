import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/auth/control/onbording%20control.dart';
import 'package:shopify/features/auth/screen/screen_onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shopify/features/auth/screen/screen_onboarding/widgets/onboarding_page.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class on extends StatelessWidget {
  const on({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(Onboardingcontroler());
    return Scaffold(
        body: Stack(
      children: [
        //horizontal scrollable pages
        PageView(
          controller: controller.pagecontroller,
          onPageChanged: controller.updatepageindicator,
          children: [
            onboarding_page(
              image: Timages.onboard,
              title: TTexts.onboardingtitile1,
              subtitle: TTexts.onboardingsubtitle1,
            ),
            onboarding_page(
              image: Timages.onboard,
              title: TTexts.onboardingtitile2,
              subtitle: TTexts.onboardingsubtitle2,
            ),
            onboarding_page(
              image: Timages.onboard,
              title: TTexts.onboardingtitle3,
              subtitle: TTexts.onboradingsubtitle3,
            )
          ],
        ),
        //skip button
        const onboarding_skip(),

        //smooth page controller
        const onboarding_dot_navigator(),
        
        // elevated button
        const Elevated_button()
      ],
    ));
  }
}





