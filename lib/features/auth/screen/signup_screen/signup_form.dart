import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/auth/control/signup_controller.dart';
import 'package:shopify/utils/validators/form_validator.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class Tform_signin_divder extends StatelessWidget {
  const Tform_signin_divder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: Divider()),
        Center(child: Text(TTexts.orsigninwith)),
        const Flexible(child: Divider()),
        const SizedBox(
          height: Tsizes.spacebetweenitems,
        ),
      ],
    );
  }
}

class Tform_agree_text extends StatelessWidget {
  const Tform_agree_text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contoller = Signupcontroller.instance;
    return Row(
      children: [
        Obx(()=>  Checkbox(value: contoller.termsandcondition.value, onChanged: (value) => contoller.termsandcondition.value = !contoller.termsandcondition.value)),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: TTexts.iagreeto,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: TTexts.privatepolicy,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(text: " and ", style: Theme.of(context).textTheme.bodySmall),
          TextSpan(text: TTexts.termsofuse),
        ]))
      ],
    );
  }
}

class Tform_Text extends StatelessWidget {
  const Tform_Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      TTexts.signuptitle,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}

class Tsignup_form extends StatelessWidget {
  const Tsignup_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());
    return Form(
        key: controller.signupformkey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        Tvalidator.validateEmptyText("First Name", value),
                    expands: false,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        labelText: TTexts.firstname),
                  ),
                ),
                SizedBox(
                  width: Tsizes.spacebtwinputfields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        Tvalidator.validateEmptyText("Last name", value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        labelText: TTexts.lastname),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Tsizes.sm,
            ),
            TextFormField(
              controller: controller.username,
              expands: false,
              validator: (value) =>
                  Tvalidator.validateEmptyText("User name", value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  labelText: TTexts.username),
            ),

            const SizedBox(
              height: Tsizes.sm,
            ),
            TextFormField(
              controller: controller.email,
              expands: false,
              validator: (value) => Tvalidator.validateemail(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: Tsizes.sm,
            ),
            TextFormField(
              controller: controller.phonenumber,
              expands: false,
              validator: (value) => Tvalidator.validatephonenumber(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  labelText: TTexts.phoneno),
            ),
            const SizedBox(
              height: Tsizes.sm,
            ),
            Obx(
              ()=> TextFormField(
                expands: false,
                obscureText: controller.hidepassword.value,
                validator: (value) => Tvalidator.validatepassword(value),
                controller: controller.password,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    labelText: TTexts.password,
                    suffixIcon:  IconButton(onPressed: ()=> controller.hidepassword.value = !controller.hidepassword.value ,
                        icon: Icon(controller.hidepassword.value ? Icons.key_off : Icons.key_rounded ))),
              ),
            ),
            const SizedBox(
              height: Tsizes.sm,
            ),

            const Tform_agree_text(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: Text(TTexts.createaccount),
                ),
              ),
            ),
          ],
        ));
  }
}
