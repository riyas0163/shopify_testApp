import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import 'containers.dart';
import 'curved_container_widget.dart';

class PrimaryCurvedWidget extends StatelessWidget {
  const PrimaryCurvedWidget({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return curved_Edges(
      child: Container(
        color: Tcolors.primary,
        padding:const EdgeInsets.only(bottom: 0),
        // here we remove the size-box height 330
        child: Stack(
          children: [
            ///background custom shapes
            const Positioned(top:-150, right: -250, child:  Scircularcpntainer(backgroundcolor: Colors.blueAccent,)),
            Positioned(top: 100, right: -300, child: Scircularcpntainer(backgroundcolor: Colors.white.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}