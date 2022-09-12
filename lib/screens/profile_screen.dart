import '../controllers/profile_controller.dart';
import '../controllers/auth_controller.dart';
import '../utils/constants.dart';
import '../utils/mytheme.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  @override
  void initState() {
    Get.put(ProfileController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    String? name = AuthController.instance.user!.displayName ?? 'No name';
    String? email = AuthController.instance.user!.email;
    String? mobile = AuthController.instance.user!.phoneNumber == ''
        ? '0000000'
        : AuthController.instance.user!.phoneNumber;
    nameController.text = name;
    emailController.text = email.toString();
    mobileController.text = mobile.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: MyTheme.appBarColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 220),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text('Name'),
                      ),
                      Obx(
                        () {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                                readOnly:
                                    ProfileController.instance.isEdit.value,
                                initialValue: name,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xFFE4EDFF)),
                                        child: const Icon(
                                          Icons.person_outline,
                                          color: Color(0xFF4C7eFF),
                                        )),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      ProfileController.instance.toggleEdit();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: Color(0xFF4C7eFF),
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text('Email'),
                      ),
                      Obx(
                        () {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                                readOnly:
                                    ProfileController.instance.isEdit.value,
                                initialValue: email,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xFFE8D8FF)),
                                        child: const Icon(
                                          Icons.email_outlined,
                                          color: Color(0xFFCC80EA),
                                        )),
                                  ),
                                )),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text('Mobile'),
                      ),
                      Obx(
                        () {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                                readOnly:
                                    ProfileController.instance.isEdit.value,
                                initialValue: mobile,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xFFCCEFE0)),
                                        child: const Icon(
                                          Icons.phone_android_outlined,
                                          color: Color(0xFF48EB9F),
                                        )),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      ProfileController.instance.toggleEdit();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: Color(0xFF4C7eFF),
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: MyTheme.greyColor,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('DOCUMENTATION'),
                      ),
                      listTileMethode(
                          Icons.privacy_tip_outlined, 'Privacy Policy', () {}),
                      listTileMethode(Icons.share_outlined, 'Share', () {}),
                      listTileMethode(Icons.logout_outlined, 'Logout', () {
                        AuthController.instance.signout();
                      }),
                    ],
                  ),
                )),
            Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width * 0.5 - 60,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(60)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CachedNetworkImage(
                      imageUrl: picUrl,
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 170,
                left: MediaQuery.of(context).size.width * 0.5 + 20,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyTheme.appBarColor),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget listTileMethode(IconData icon, String title, Function() ontap) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        leading: Icon(icon,
            size: 20, color: title == 'Logout' ? Colors.red : Colors.black),
        title: Text(
          title,
          style:
              TextStyle(color: title == 'Logout' ? Colors.red : Colors.black),
        ),
        onTap: ontap,
      ),
    );
  }

  Widget IconTextFormField(String title, String iValue, IconData icon,
      Color iconbackcolor, Color iconcolor, Function()? ontap) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Text(title),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
            readOnly: ProfileController.instance.isEdit.value,
            initialValue: iValue,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: iconbackcolor),
                    child: Icon(
                      icon,
                      color: iconcolor,
                    )),
              ),
              suffixIcon: title == 'Email'
                  ? Container()
                  : GestureDetector(
                      onTap: ontap,
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF4C7eFF),
                        ),
                      ),
                    ),
            )),
      ),
    ]);
  }
}
