import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/sizes.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/heloper_functions.dart';
import '../../Main_Screen/grid_view_container.dart';

class Tbillingpaymentsection extends StatelessWidget {
  const Tbillingpaymentsection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Column(
      children: [
        MultipleSectionHeadings(title: "Payment method",buttontitle: "Change",onpressed: (){},),
        const SizedBox(height: Tsizes.spacebetweenitems,),
        Row(
          children: [
            TRoundcontainer(
              height: 35,
              width: 60,
              bordercolor:dark ? Tcolors.light : Colors.white,
              padding: const EdgeInsets.all(Tsizes.sm),
              child: Image(image: AssetImage(Timages.paytm),fit: BoxFit.contain,),
            ),
            const SizedBox(width: Tsizes.spacebetweenitems,),
            Text("Paytm",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
