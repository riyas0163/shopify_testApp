
import 'package:flutter/material.dart';
import 'package:shopify/common/styles/spacing.dart';
import 'package:shopify/common/widgets/login/widgets/login_widget.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Tspacingstyle.paddingwithappbarheight,
          child: const Column(
            children: [
              //Image(image: AssetImage(Timages.successanimation)),
              intro_Text(),
             email_password_field(),
              //  Icon_button(deviderstring: TTexts.orsigninwith,),
              // SizedBox(height: Tsizes.spacebtwinputfields,),
           // const  Footer()
            ],
          ),
        ),
      ),
    );
  }
}


