import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/auth/control/login_controller.dart';
import 'package:shopify/features/auth/screen/forgot_password/forgot_password.dart';
import 'package:shopify/features/auth/screen/signup_screen/signup.dart';
import 'package:shopify/utils/validators/form_validator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.g_mobiledata_rounded),
          ),
        ),
        const SizedBox(
          width: Tsizes.md,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.face),
          ),
        ),
      ],
    );
  }
}

class Icon_button extends StatelessWidget {
  const Icon_button({
    super.key,
    required this.deviderstring,
  });

  final String deviderstring;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: Divider()),
        Center(child: Text(deviderstring)),
        const Flexible(child: Divider()),
        const SizedBox(
          height: Tsizes.spacebetweenitems,
        ),
      ],
    );
  }
}

class email_password_field extends StatelessWidget {
  const email_password_field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginformkey,
        child: Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: TTexts.email),
            validator: (value) => Tvalidator.validateemail(value),
          ),
          SizedBox(
            height: Tsizes.spacebtwinputfields,
          ),
          Obx(
            () => TextFormField(
              expands: false,
              obscureText: controller.hidepassword.value,
              validator: (value) => Tvalidator.validatepassword(value),
              controller: controller.password,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value = !controller.hidepassword.value,
                      icon: Icon(controller.hidepassword.value
                          ? Icons.key_off
                          : Icons.key_rounded))),
            ),
          ),
          SizedBox(
            height: Tsizes.spacebtwinputfields / 2,
          ),
          Row(
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(value: controller.rememberme.value, onChanged: (value) => controller.rememberme.value = !controller.rememberme.value),
                  ),
                  Text(TTexts.rememberme)
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              TextButton(
                  onPressed: () => Get.to(const forgotpassword()),
                  child: Text(TTexts.forgotpassword)),
            ],
          ),
          SizedBox(
            height: Tsizes.spacebetweensec,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.emailAndPasswordSignIn(),
              child: Text(TTexts.signin),
            ),
          ),
          const SizedBox(
            height: Tsizes.md,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(const signuppage()),
              child: Text(TTexts.createaccount),
            ),
          ),
          SizedBox(
            height: Tsizes.spacebtwinputfields,
          ),
        ],
      ),
    ));
  }
}

class intro_Text extends StatelessWidget {
  const intro_Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image(image: AssetImage())
        Text(
          TTexts.logintitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: Tsizes.sm,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            TTexts.loginsubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
