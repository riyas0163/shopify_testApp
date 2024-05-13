import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class profile_menu extends StatelessWidget {
  const profile_menu({
    super.key,
     this.icon = Icons.arrow_forward_ios_outlined,
    required this.onpressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onpressed;
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Padding(
        padding:  const EdgeInsets.symmetric(vertical :Tsizes.spacebetweenitems),
        child: Row(
          children: [
            Expanded(flex : 3,child: Text(title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
            Expanded(flex : 5,child: Text(value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
             Expanded(child: Icon(icon ,size: 18,))

          ],
        ),
      ),
    );
  }
}