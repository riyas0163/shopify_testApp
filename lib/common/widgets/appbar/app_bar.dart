import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class Tappbar extends StatelessWidget implements PreferredSizeWidget {
  const Tappbar({
    super.key,
    this.title,
    this.showbackarrow = false,
    this.leadingicon,
    this.actions,
    this.leadingonpressed,
  });

  final Widget? title;
  final bool showbackarrow;
  final IconData? leadingicon;
  final List<Widget>? actions;
  final VoidCallback? leadingonpressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isdarkmode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Tsizes.sm),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: dark ? Colors.white : Colors.black,
                ))
            : leadingicon != null
                ? IconButton(
                    onPressed: leadingonpressed, icon: Icon(leadingicon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
