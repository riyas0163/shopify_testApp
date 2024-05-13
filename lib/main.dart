import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/repository_authetication/authentication_repository.dart';
import 'firebase_options.dart';


Future<void> main()  async {

  //  Add widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //  init local storage
  await GetStorage.init();


  // todo : init payment methods
  // await natives plash;
 //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // todo : initialize firebase

  // initialize firebase & authentication repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(Authrepository()),
  );

  // todo : initialize authentication
  runApp(const app());



}





