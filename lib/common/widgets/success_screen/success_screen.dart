import 'package:flutter/material.dart';
import 'package:shopify/common/styles/spacing.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/constants/text_strings.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onpressed
  });

  final String image,title,subtitle;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Padding(
          padding: Tspacingstyle.paddingwithappbarheight *2,
          child: Column(
           children: [
             // image
             Image(image: AssetImage(image),width: THelperfunctions.screenwidth() * 0.6),
             const SizedBox(height: Tsizes.spacebetweenitems,),

             // title/ sub title
             Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
             const SizedBox(height: Tsizes.spacebetweenitems,),
             Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
             const SizedBox(height: Tsizes.spacebetweenitems,),


             // button
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(onPressed: onpressed,child: Text(TTexts.scontinue),),
             )
           ],
          ),
        ),
      ),
    );
  }

























}
