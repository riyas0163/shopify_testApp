import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class islike_iconbutton extends StatelessWidget {
  const islike_iconbutton({
    super.key,
    this.width,
    this.height,
    this.size = Tsizes.lg,
    required this.icon,
    this.color,
    this.onpressed,
    this.backgroundcolor,
  });

  final double? width,height,size;
  final IconData icon;
  final Color? color;
  final VoidCallback? onpressed;
  final Color? backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onpressed, icon: Icon(icon,size: size,color: color,)),
    );
  }
}