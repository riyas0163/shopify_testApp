import 'package:flutter/material.dart';
import 'package:shopify/common/widgets/text/section_heading.dart';
import 'package:shopify/utils/constants/sizes.dart';

class Tbillingaddress extends StatelessWidget {
  const Tbillingaddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MultipleSectionHeadings(title: "Shipping Address",buttontitle: "Change",onpressed: (){},),
        Text("Shopify",style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: Tsizes.spacebetweenitems,),
        Row(
          children: [
            const Icon(Icons.phone_android,color: Colors.grey,size: 16,),
            const SizedBox(width: Tsizes.spacebetweenitems,),
            Text("+91 1234567890",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_on_outlined,color: Colors.grey,size: 16,),
            //SizedBox(width: Tsizes.spacebetweenitems,),
            Flexible(child: Text("456,second street , anna nagar, chennai ",style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,))
          ],
        )
      ],
    );
  }
}
