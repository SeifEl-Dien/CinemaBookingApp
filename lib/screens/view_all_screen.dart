import '../controllers/common_controller.dart';
import '../utils/mytheme.dart';
import '../controllers/location_controller.dart';
import '../widgets/item_block.dart';
import '../model/menu_model.dart';
import '../utils/dummy_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  MenuModel menu = Get.arguments;

  final selectedTextStyle = const TextStyle(color: MyTheme.splash);
  final normalTextStyle = const TextStyle(color: Colors.black45);
  late List<dynamic> list;
  @override
  void initState() {
    if (menu.name.contains('Event')) {
      list = events;
    } else if (menu.name.contains('Movie')) {
      list = movies;
    } else {
      list = plays;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        CommonController.instance.tabController.animateTo(0);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocationController.instance.city.value == 'NA'
                ? menu.name
                : '${menu.name} in ${LocationController.instance.city}',
            style: const TextStyle(fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                        list: list,
                        isMovie: menu.name.toLowerCase().contains('Movies')
                            ? true
                            : false));
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: TabBar(
                  tabs: CommonController.instance.tabs,
                  controller: CommonController.instance.tabController,
                  indicatorColor: MyTheme.splash,
                  indicatorPadding: const EdgeInsets.all(15),
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: selectedTextStyle,
                  unselectedLabelColor: Colors.black45,
                  labelColor: MyTheme.splash,
                  isScrollable: false,
                  enableFeedback: false,
                  onTap: (index) => CommonController.instance.updatepage(index),
                )),
            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: CommonController.instance.pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
                          childAspectRatio: 0.66,
                        ),
                        itemBuilder: (_, index) {
                          return ItemBlock(
                            isMovie: list == movies ? true : false,
                            model: list[index],
                            height: 220,
                            width: 150,
                            onTap: (model) {},
                          );
                        },
                        itemCount: list.length,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  final bool isMovie;
  final List<dynamic> list;
  MySearchDelegate({
    this.isMovie = false,
    required this.list,
  });
  resultwidget(dynamic model) {
    return ItemBlock(
      model: model,
      height: 180,
      width: 150,
      isMovie: isMovie,
      onTap: (model) {},
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null.toString());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? list
        : list
            .where(
              (element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (_, index) {
            return resultwidget(suggestionList[index]);
          },
          itemCount: suggestionList.length,
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      hintColor: Colors.grey,
      inputDecorationTheme:
          const InputDecorationTheme(focusedBorder: InputBorder.none),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: MyTheme.appBarColor,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light)),
      textTheme: Theme.of(context).textTheme.copyWith(
            headline6: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              decorationThickness: 0.0000001,
            ),
          ),
    );
  }
}
