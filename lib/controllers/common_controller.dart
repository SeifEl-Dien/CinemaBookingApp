import '../utils/dummy_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();
  late TabController tabController;
  late List<Tab> tabs;
  final tablist = [
    'Now showing',
    'Up Coming',
    'Exclusive',
  ];
  late RxString screen;

  @override
  void onInit() {
    tabController = TabController(length: tablist.length, vsync: this);
    tabs = tablist
        .map((e) => Tab(
              text: e,
            ))
        .toList();
    screen = screens[0].obs;
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final PageController pageController = PageController(keepPage: false);
  updatepage(int index) async {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  updateScreen(String screen) {
    this.screen = screen.obs;
    update();
  }
}
