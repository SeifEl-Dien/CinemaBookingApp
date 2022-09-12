import '../screens/cinemas_list_screen.dart';
import '../widgets/offers_block.dart';
import '../widgets/review_block.dart';
import '../utils/mytheme.dart';
import '../widgets/crew_cast_block.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  final dynamic model = Get.arguments[0];
  final dynamic index = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => CinemasListScreen(
                  model: model,
                ));
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: MyTheme.splash,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              )),
          child: SizedBox(
            height: 50,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/armchair.svg',
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                const Text('Book Seats', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            backgroundColor: MyTheme.appBarColor,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
            title: Text(model.title),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${model.title}$index',
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${model.bannerUrl}'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: const Color(0xFFF5F5FA),
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      firstblock(model),
                      const SizedBox(height: 20),
                      const OffersBlock(),
                      const SizedBox(height: 20),
                      const ReviewBlock(),
                      const SizedBox(height: 20),
                      const CrewCastBlock(),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget firstblock(model) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titlewidget(model),
          const SizedBox(height: 5),
          datewidget,
          const SizedBox(height: 10),
          screenwidget,
          const SizedBox(height: 10),
          descriptionwidget
        ],
      ),
    );
  }

  titlewidget(model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${model.title}',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const Spacer(),
          const Icon(
            Icons.favorite,
            color: MyTheme.splash,
            size: 30,
          ),
          const SizedBox(width: 5),
          Text(
            '${model.like}%',
            style: const TextStyle(fontSize: 20),
          )
        ],
      );
  final screenwidget = Row(
    children: [
      const Text(
        'English',
        style: TextStyle(color: MyTheme.splash),
      ),
      const SizedBox(width: 10),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: MyTheme.splash.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: const Text(
          '3D',
          style: TextStyle(color: MyTheme.splash),
        ),
      ),
      const SizedBox(width: 10),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: MyTheme.splash.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: const Text(
          '2D',
          style: TextStyle(color: MyTheme.splash),
        ),
      ),
    ],
  );
  final datewidget = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text(
        'UA | Oct 15, 2019',
        style: TextStyle(color: Colors.black45),
      ),
      Text(
        '1.8K votes',
        style: TextStyle(color: MyTheme.splash),
      ),
    ],
  );
  final descriptionwidget = RichText(
      text: TextSpan(style: const TextStyle(color: Colors.black45), children: [
    const WidgetSpan(
        child: Icon(
      Icons.history,
      size: 15,
      color: Colors.black45,
    )),
    const WidgetSpan(
        child: SizedBox(
      width: 10,
    )),
    const TextSpan(
      text: '2h 29m',
    ),
    const WidgetSpan(
        child: SizedBox(
      width: 10,
    )),
    WidgetSpan(
        child: SvgPicture.asset(
      'assets/icons/theater_masks.svg',
      color: Colors.black45,
      height: 15,
      width: 15,
    )),
    const WidgetSpan(
        child: SizedBox(
      width: 10,
    )),
    const TextSpan(
      text: 'Action,Drama',
    ),
  ]));
}
