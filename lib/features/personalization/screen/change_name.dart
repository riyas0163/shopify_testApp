import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/constants/sizes.dart';
import 'package:shopify/utils/constants/text_strings.dart';
import 'package:shopify/utils/validators/form_validator.dart';

import '../../auth/control/update_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatenameCntroller());
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Name',style: Theme.of(context).textTheme.bodySmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultspace),
        child:  Column(
          children: [
            ///heading
            Text("Use real name for easy verification.This name will be appear on several pages",style: Theme.of(context).textTheme.labelMedium,),
             SizedBox(height: Tsizes.spacebetweensec,),
            Form(
              key: controller.updateUsernameFormkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstname,
                    validator: (value) => Tvalidator.validateEmptyText('first name', value),
                    expands: false,
                    decoration:  InputDecoration(
                      labelText: TTexts.firstname,prefixIcon: const Icon(Icons.supervised_user_circle),

                    ),
                  ),
                  SizedBox(height: Tsizes.spacebtwinputfields,),
                  TextFormField(
                    controller: controller.lastname,
                    validator: (value) => Tvalidator.validateEmptyText('last name', value),
                    expands: false,
                    decoration:  InputDecoration(
                      labelText: TTexts.lastname,prefixIcon: const Icon(Icons.supervised_user_circle),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Tsizes.spacebetweensec,),

            /// save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.updateUserName(), child: const Text('save')),
            )
          ],
        ),
      ),
    );
  }
}
