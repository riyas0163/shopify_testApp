import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/heloper_functions.dart';
import '../icon/tcircular_icon.dart';


class TproductQuantityaddRemove extends StatelessWidget {
  const TproductQuantityaddRemove({
    super.key, required this.quantity, this.add, this.remove,
  });


  final int quantity;
  final VoidCallback? add,remove;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      children: [
        TCircularicon(
          icon: Icons.remove,
          width: 32,
          height: 32,
          size: Tsizes.md,
          color: THelperfunctions.isdarkmode(context) ? Colors.black : Colors.white,
          backgroundcolor:Colors.black,
          onpressed: remove,
        ),
        const SizedBox(width: Tsizes.spacebetweenitems,),
        Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: Tsizes.spacebetweenitems,),
        TCircularicon(
          icon: Icons.add,
          width: 32,
          height: 32,
          size: Tsizes.md,
          color:  THelperfunctions.isdarkmode(context) ? Colors.black : Colors.white ,
          backgroundcolor: Colors.blue,
          onpressed: add,
        ),
      ],
    );
  }
}