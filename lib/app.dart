import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopify/routes/app_routes.dart';
import 'package:shopify/utils/theme/theme1.dart';

import 'bindings/General_bndings.dart';






class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TappTheme.lighttheme,
      darkTheme: TappTheme.darktheme,
      initialBinding: Generalbindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: Colors.grey,body: Center(child: CircularProgressIndicator(color: Colors.white,),),),

    );
  }
}