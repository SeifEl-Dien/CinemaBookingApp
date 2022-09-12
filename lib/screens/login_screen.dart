import '../controllers/auth_controller.dart';
import '../screens/signup_screen.dart';
import '../utils/mytheme.dart';
import '../utils/social_buttons.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final forgotpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
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
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Welcome,',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                Text(
                  'Login to book your seat',
                  style: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.7)),
                ),
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
                        'Login to your account',
                        style: TextStyle(
                            fontSize: 16,
                            color: MyTheme.splash,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: emailcontroller,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Username',
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: MyTheme.greyColor,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: passwordcontroller,
                          style: const TextStyle(color: Colors.black),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'Forgot Password?',
                                  content: TextFormField(
                                    controller: forgotpasswordcontroller,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      hintText: 'Email Address',
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      fillColor: MyTheme.greyColor,
                                      filled: true,
                                    ),
                                  ),
                                  radius: 10,
                                  onWillPop: () {
                                    forgotpasswordcontroller.text = '';
                                    return Future.value(true);
                                  },
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  confirm: ElevatedButton(
                                      onPressed: () {
                                        AuthController.instance.forgotpassword(
                                            forgotpasswordcontroller.text
                                                .trim());
                                        forgotpasswordcontroller.text = '';
                                        Get.back();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: MyTheme.splash,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Text(
                                            'Send reset mail',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      )));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            AuthController.instance.loginwithemailandpassword(
                                emailcontroller.text.trim(),
                                passwordcontroller.text.trim());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: MyTheme.splash,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'LOGIN',
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
                              ontap: () {
                                AuthController.instance.googlelogin();
                              },
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
                    text: 'Don’t have an account ? ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const SignUpScreen());
                        /*                       Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen())); */
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
      ),
    );
  }
}
