import './controllers/common_controller.dart';
import './controllers/location_controller.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './utils/mytheme.dart';
import './controllers/auth_controller.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(LocationController());
  Get.put(CommonController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: AuthController.instance.user == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
