import 'package:flutter/material.dart';

import 'curved_edgs.dart';

class curved_Edges extends StatelessWidget {
  const curved_Edges({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // custom shape for home screen
      clipper: CustomCurvededgs(),
      child: child,
    );
  }
}