import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/validators/form_validator.dart';

import '../../../utils/constants/text_strings.dart';
import '../control/user_controller.dart';

class ReauthLoginForm extends StatelessWidget {
  const ReauthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re- Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Form(
            key: controller.reAuthFormkey,
            child: Column(
              children: [

                /// email
                TextFormField(
                  controller: controller.verifyemail,
                  validator: Tvalidator.validateemail,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.chevron_right_sharp),labelText: TTexts.email
                  ),
                ),
                SizedBox(height: Tsizes.spacebtwinputfields,),

                ///password
                Obx(
                  ()=>TextFormField(
                    obscureText: controller.hidepassword.value,
                    controller: controller.verifypassword,
                    validator: (value) => Tvalidator.validateEmptyText('password', value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),labelText: TTexts.password,
                      suffixIcon: IconButton(onPressed: ()=> controller.hidepassword.value = !controller.hidepassword.value,icon: const Icon(Icons.key_off_outlined),)
                    ),
                  ),
                ),
                SizedBox(height: Tsizes.spacebetweensec,),

                /// login button
                SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPassword, child: const Text("verify")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
