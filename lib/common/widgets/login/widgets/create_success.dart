import 'package:flutter/material.dart';
import 'package:shopify/common/styles/spacing.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class create extends StatelessWidget {
  const create({super.key, required this.title, required this.subtitle, required this.image, required this.onpressed});

  final String image,title , subtitle;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Tspacingstyle.paddingwithappbarheight *2,
          child: Column(
            children: [
              Image(image: AssetImage(image)),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              Text(subtitle),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onpressed, child: Text(TTexts.scontinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
