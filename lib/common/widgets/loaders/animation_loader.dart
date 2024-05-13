import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopify/utils/constants/colors.dart';
import 'package:shopify/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onactionpressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onactionpressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(
            height: Tsizes.defaultspace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Tsizes.defaultspace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onactionpressed,
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Tcolors.light),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
