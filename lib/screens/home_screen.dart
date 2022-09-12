import '../utils/movies_item.dart';
import '../controllers/auth_controller.dart';
import '../controllers/location_controller.dart';
import '../controllers/shared_pref.dart';
import '../screens/profile_screen.dart';
import '../screens/select_location_screen.dart';
import '../utils/constants.dart';
import '../utils/custom_slider.dart';
import '../utils/dummy_data.dart';
import '../utils/event_item.dart';
import '../utils/menu_item.dart';
import '../utils/mytheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  @override
  void initState() {
    SharedPref.getLocation().then((value) => city = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    final Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: MyTheme.appBarColor),
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const ProfileScreen());
                        },
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: picUrl,
                          height: 60,
                          width: 60,
                        ),
                      )),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AuthController.instance.user!.displayName ?? 'Name',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
                            Get.to(() => const SelectionLocationScreen());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                LocationController.instance.city.value == 'NA'
                                    ? 'Select your location'
                                    : LocationController.instance.city.value,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    inherit: true,
                                    fontSize: 14),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white.withOpacity(0.7),
                              )
                            ],
                          ),
                        ),
                      )
                      /*  DropdownButton<String>(
                          value: city,
                          dropdownColor: MyTheme.statusBar,
                          isDense: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          items: cities
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (st) {
                            setState(() {
                              city = st!;
                            });
                          }) */
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/search.svg')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/notification.svg',
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            body: SizedBox(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                      width: size.width,
                      child: PageView.builder(
                          itemCount: 3,
                          itemBuilder: (_, i) {
                            return CustomSlider(
                              index: i,
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'SEAT CATEGORIES',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    const MenuItems(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'RECOMMENDED SEATS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    const MoviesItems(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NEARBY THEATRES',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View all',
                              style: TextStyle(color: MyTheme.splash),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5,
                                  color: Colors.black.withOpacity(0.2))),
                          height: size.height * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/map.png',
                              fit: BoxFit.fitWidth,
                              width: size.width,
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/spotlights.svg',
                            color: Colors.black.withOpacity(0.8),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'EVENTS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View all',
                              style: TextStyle(color: MyTheme.splash),
                            ),
                          ),
                        ],
                      ),
                    ),
                    EventItems(
                      eventsorplays: events,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/theater_masks.svg',
                            color: Colors.black.withOpacity(0.8),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'PLAYS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View all',
                              style: TextStyle(color: MyTheme.splash),
                            ),
                          ),
                        ],
                      ),
                    ),
                    EventItems(
                      eventsorplays: plays,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
