import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopify/common/widgets/login/login.dart';
import 'package:shopify/features/auth/control/forget_password_controller.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/constants/text_strings.dart';

class reset extends StatelessWidget {
  const reset({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Column(
            children: [
             Lottie.asset("assets/lottie_json/Animation - 1711622011414.json"),
              Text(
                email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: Tsizes.spacebetweenitems,),
              Text(TTexts.changeyourpasswordtitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: Tsizes.spacebetweenitems,),
              Text(TTexts.changeyourpasswordsubtitle),
              const SizedBox(height: Tsizes.spacebetweenitems,),
              //button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(const login()), child: const Text("Done")),),
              const SizedBox(height: Tsizes.spacebetweenitems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEMail(email), child: Text(TTexts.resendemail)))
            ],
          ),
        ),
      ),
    );
  }
}
