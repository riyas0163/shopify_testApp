import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';


class Trating_share extends StatelessWidget {
  const Trating_share({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // rating
            const Icon(Icons.star,color: Colors.amber,size: 24,),
            const SizedBox(width: Tsizes.spacebetweenitems / 2,),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: "5.0",style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(text: "(199)")
                    ]
                )
            )

          ],
        ),
        /// share
        IconButton(onPressed: (){}, icon: const Icon(Icons.share))
      ],
    );
  }
}