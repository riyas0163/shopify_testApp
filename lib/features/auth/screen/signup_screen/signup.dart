import 'package:flutter/material.dart';
import 'package:shopify/features/auth/screen/signup_screen/signup_form.dart';
import 'package:shopify/utils/constants/sizes.dart';

class signuppage extends StatelessWidget {
  const signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, title:  const Tform_Text() ,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title

              // SizedBox(
              //   height: Tsizes.sm,
              // ),
              //signup textformfield
              Tsignup_form(),

              SizedBox(
                height: Tsizes.sm,
              ),
              //elevated button

              SizedBox(
                height: Tsizes.spacebetweenitems,
              ),
              //sign divider
              // Tform_signin_divder(),
              // SizedBox(
              //   height: Tsizes.sm,
              // ),
              // Footer()
            ],
          ),
        ),
      ),
    );
  }
}


