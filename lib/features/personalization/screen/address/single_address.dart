import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

import '../../../shop/screen/Main_Screen/grid_view_container.dart';

class Singleaddress extends StatelessWidget {
  const Singleaddress({super.key, required this.selectedaddress});

  final bool selectedaddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TRoundcontainer(
        width: double.infinity,
        padding: const EdgeInsets.all(Tsizes.md),
        showborder: true,
        backgroundcolor: selectedaddress
            ? Tcolors.primary.withOpacity(0.5)
            : Colors.transparent,
        bordercolor: selectedaddress
            ? Colors.transparent
            : dark
                ? CupertinoColors.darkBackgroundGray
                : Colors.grey,
        margin: const EdgeInsets.only(bottom: Tsizes.spacebetweenitems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              child: Icon(
                selectedaddress ? Icons.check_circle : null,
                color: selectedaddress
                    ? dark
                        ? Tcolors.light
                        : Tcolors.dark
                    : null,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "user ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: Tsizes.sm,
                ),
                const Text("+91 123456789",maxLines: 1,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: Tsizes.sm,),
                const Text("456/ , anna nager, chennai -600231",softWrap: true,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
