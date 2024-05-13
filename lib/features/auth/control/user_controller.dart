// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shopify/data/repositories/repository_authetication/user_repository.dart';
// import 'package:shopify/features/personalization/model/user_model.dart';
//
// class Usercontroller extends GetxController{
//   static Usercontroller get instance => Get.find();
//
//   final profileloading = false.obs;
//   Rx<Usermodel> user = Usermodel.empty().obs;
//
//
//   final userRepository = Get.put(UserRepository());
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserRecord();
//   }
//
//   Future<void> fetchUserRecord() async{
//     try {
//       profileloading.value = true;
//       final user = await userRepository.fetchUserdetails();
//       this.user(user);
//     } catch (e) {}
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
