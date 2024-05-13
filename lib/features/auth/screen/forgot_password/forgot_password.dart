import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/auth/control/forget_password_controller.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/constants/text_strings.dart';
import 'package:shopify/utils/validators/form_validator.dart';

class forgotpassword extends StatelessWidget {
  const forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: Padding(
        padding:  const EdgeInsets.all(Tsizes.defaultspace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //headings
            Text(TTexts.forgotpasswordtitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: Tsizes.spacebetweenitems,),
            Text(TTexts.forgotpassowrdsubtitle,style: Theme.of(context).textTheme.labelMedium,),
            SizedBox(height: Tsizes.spacebetweensec*1,),
            //textformfield

            Form(
              key: controller.forgetpasswordkey,
              child: TextFormField(
                controller: controller.email,
                validator: Tvalidator.validateemail,
                decoration: InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
            ),
            SizedBox(height: Tsizes.spacebtwinputfields,),

            //submit button
            SizedBox(width:double.infinity,child: ElevatedButton(onPressed: ()=> controller.sendpasswordResetEmail(), child: Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}
