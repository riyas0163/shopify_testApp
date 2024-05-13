import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/data/repositories/repository_authetication/authentication_repository.dart';
import 'package:shopify/features/auth/control/verify_controller.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';

class Emailverify extends StatelessWidget {
  const Emailverify({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Authrepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Column(
            children: [
              Image(image: AssetImage(Timages.emailanimation)),
              Text(
                TTexts.confirmemail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              Text(TTexts.confirmemailsubtitle),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        Get.to(() => controller.checkemailVerificationStatus()

                            // create(
                            //   title: TTexts.youraccountcreatedtitle,
                            //   subtitle: TTexts.youraccountcreatedsubtitle,
                            //   image: Timages.successanimation,
                            //   onpressed: () => Get.to(const login()),
                            // )
                            ),
                    child: Text(TTexts.scontinue)),
              ),
              const SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendemailVerification(),
                    child: Text(
                      TTexts.resendemail,
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
