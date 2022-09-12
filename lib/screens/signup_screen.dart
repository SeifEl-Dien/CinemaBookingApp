import '../controllers/auth_controller.dart';
import '../controllers/input_validator.dart';
import '../utils/mytheme.dart';
import '../utils/social_buttons.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final cnfpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/splash_icon.svg'),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create your account',
                      style: TextStyle(
                          fontSize: 16,
                          color: MyTheme.splash,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: namecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Name',
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Email Address',
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: cnfpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (InputValidator.validateField(
                                  namecontroller.text.trim()) &&
                              InputValidator.validateField(
                                  emailcontroller.text.trim())) {
                            if (InputValidator.validatepassword(
                                passwordcontroller.text,
                                cnfpasswordcontroller.text)) {
                              AuthController.instance
                                  .signupwithemailandpassword(
                                      emailcontroller.text.trim(),
                                      passwordcontroller.text.trim());
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: MyTheme.splash,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          )),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              'OR',
                              style: TextStyle(color: Color(0xFFC1C1C1)),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          SocialButtons(
                            svgicon: 'assets/icons/google.svg',
                            name: 'Google',
                            ontap: () {},
                            backcolor: MyTheme.redLight,
                          ),
                          const SizedBox(width: 10),
                          SocialButtons(
                            svgicon: 'assets/icons/facebook.svg',
                            name: 'Facebook',
                            ontap: () {},
                            backcolor: MyTheme.blueLight,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: 'already have an account ? ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: 'Login',
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.back();
                    },
                ),
                const TextSpan(
                  text: ' here.',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
