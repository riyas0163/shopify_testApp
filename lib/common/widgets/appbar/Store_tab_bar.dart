import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/utils/device/device%20utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/heloper_functions.dart';


class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  // we wants to give tab background color we must use the material widget
  // to do that only {preferred-sized } widget that's why created a custom class


  const TTabbar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: Tcolors.primary,
          unselectedLabelColor: CupertinoColors.darkBackgroundGray,
          labelColor: THelperfunctions.isdarkmode(context)? Colors.white : Colors.black,
          tabs:  tabs,

          ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceutils.getappbargeight());
}