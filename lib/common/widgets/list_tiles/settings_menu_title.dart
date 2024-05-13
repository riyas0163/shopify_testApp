import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/colors.dart';

class Tsettingsmenutitle extends StatelessWidget {
  const Tsettingsmenutitle({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing, this.ontap});

  final IconData icon;
  final String title,subtitle;
  final Widget? trailing;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: Tcolors.primary,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: ontap,
    );
  }
}
