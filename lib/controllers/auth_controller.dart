import 'dart:async';

import 'package:cinemabookingapp/controllers/location_controller.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../utils/mytheme.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(
      Duration(seconds: isLoging ? 0 : 2),
      () async {
        if (user == null) {
          isLoging = false;
          update();
          // Get.offAll(() => LoginScreen());
        } else {
          isLoging = true;
          update();
          //Get.offAll(() => HomeScreen());
        }
      },
    );
  }
  /* 
   manual splash screen--splashscreen.dart+main home:
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  } 

  loginRedirect(User? user) {
    Timer(
      Duration(seconds: isLoging ? 0 : 2),
      () async {
        if (user == null) {
          isLoging = false;
          update();
           Get.offAll(() => LoginScreen());
        } else {
          isLoging = true;
          update();
          Get.offAll(() => HomeScreen());
        }
      },
    );
  }*/

  void signupwithemailandpassword(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      getErrorSnack('Account creating failed', e);
    }
  }

  void loginwithemailandpassword(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      getErrorSnack('Login failed', e);
    }
  }

  void googlelogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;
    update();
    try {
      googleSignIn.disconnect();
    } catch (e) {}
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication? googleauth =
            await googleSignInAccount.authentication;
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
        await auth.signInWithCredential(credentials);
        Get.offAll(() => const HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      getErrorSnack('Google login failed', e);
    }
  }

  void forgotpassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnack('Reset mail sent successfully, Check your mail!');
    } on FirebaseAuthException catch (e) {
      getErrorSnack('Error', e);
    }
  }

  getErrorSnack(String message, _) {
    Get.snackbar('Error', '$message\n${_.message}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyTheme.redTextColor,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redTextColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getSuccessSnack(String message) {
    Get.snackbar('Success', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyTheme.greenTextColor,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  void signout() async {
    await auth.signOut();
    Get.offAll(() => const LoginScreen());
    LocationController.instance.city = 'NA'.obs;
    update();
  }
}
