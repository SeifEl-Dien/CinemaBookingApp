import '../controllers/calendar_controller.dart';
import '../controllers/common_controller.dart';
import '../model/movies_model.dart';
import '../screens/seat_selection_screen.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';
import '../widgets/theatre_block.dart';
import '../controllers/seat_selection_controller.dart';
import '../utils/custom_calendar.dart';
import '../utils/screen_selection_block.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CinemasListScreen extends StatefulWidget {
  final MovieModel model;

  const CinemasListScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<CinemasListScreen> createState() => _CinemasListScreenState();
}

class _CinemasListScreenState extends State<CinemasListScreen> {
  final DateFormat format = DateFormat('dd MMM');
  final now = DateTime.now();
  String selectedDate = DateFormat('dd MMM').format(DateTime.now());
  String selectedLanguage = 'English';
  String selectedScreen = '3D';

  late CalendarController calcommonController;
  @override
  void initState() {
    calcommonController = Get.put(CalendarController());
    Get.put(SeatSelectionController());

    initializeDateFormatting().then((_) => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* final todayDate = format.format(now);
    final tomorrowDate =
        format.format(DateTime(now.year, now.month, now.day + 1));
    String text = '';
    if (selectedDate == todayDate) {
      text = 'Today, ';
    } else if (selectedDate == tomorrowDate) {
      text = 'Tomorrow, ';
    } */
    return WillPopScope(
      onWillPop: () {
        calcommonController.updateToInitailDate();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5FA),
        bottomNavigationBar: BottomAppBar(
          color: MyTheme.appBarColor,
          elevation: 0,
          child: SizedBox(
              width: double.maxFinite,
              height: AppBar().preferredSize.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatefulBuilder(builder: (_, setState) {
                    final todayDate = format.format(now);
                    final tomorrowDate =
                        format.format(now.add(const Duration(days: 1)));
                    String text = "";
//
                    if (format.format(
                            calcommonController.selectedMovieDate.value) ==
                        todayDate) {
                      text = "Today, ";
                      //
                    } else if (format.format(
                            calcommonController.selectedMovieDate.value) ==
                        todayDate) {
                      text = "Tomorrow, ";
                    } else {
                      //
                      text =
                          "${DateFormat("EEE").format(calcommonController.selectedMovieDate.value)}, ";
                    }

                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                                context: context,
                                builder: (_) => CustomCalendar(),
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.35))
                            .then((value) => setState(() {
                                  //  if (value != null) {selectedDate = format.format(value);}
                                }));
                      },
                      child: SizedBox(
                        height: double.maxFinite,
                        child: Row(children: [
                          const Icon(Icons.calendar_month,
                              size: 25, color: Colors.white),
                          const SizedBox(width: 5),
                          Text(
                              //
                              '$text${format.format(calcommonController.selectedMovieDate.value)}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                          const SizedBox(width: 5),
                          const Icon(Icons.keyboard_arrow_down,
                              color: Colors.white),
                        ]),
                      ),
                    );
                  }),
                  StatefulBuilder(builder: (context, setState) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => ScreenSelectionBlock(
                            onScreenSelect: (screen) {
                              CommonController.instance.updateScreen(screen);
                              setState(() => selectedScreen = screen);
                            },
                          ),
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.25),
                        );
                      },
                      child: SizedBox(
                        height: double.maxFinite,
                        child: Row(children: [
                          Text('$selectedLanguage, $selectedScreen',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                          const SizedBox(width: 5),
                          const Icon(Icons.keyboard_arrow_down,
                              color: Colors.white),
                        ]),
                      ),
                    );
                  })
                ],
              )),
        ),
        appBar: AppBar(
          title: Text(widget.model.title),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: TheatreSearchDelegate(widget.model));
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            )
          ],
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: theatres.length,
          itemBuilder: (_, index) => Container(
            padding:
                EdgeInsets.only(bottom: index != theatres.length - 1 ? 20 : 0),
            child: TheatreBlock(
                model: theatres[index],
                onTimeTap: (index) {
                  Get.to(() => SeatSelectionScreen(
                      theatreModel: theatres[index], movieModel: widget.model));
                }),
          ),
        ),
      ),
    );
  }
}

class TheatreSearchDelegate extends SearchDelegate {
  final MovieModel model;

  TheatreSearchDelegate(this.model);

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
        ? theatres
        : theatres
            .where(
              (element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: suggestionList.length,
      itemBuilder: (_, index) => Container(
        padding: EdgeInsets.only(
            bottom: index != suggestionList.length - 1 ? 20 : 0),
        child: TheatreBlock(
            model: suggestionList[index],
            onTimeTap: (index) {
              Get.to(() => SeatSelectionScreen(
                  theatreModel: suggestionList[index], movieModel: model));
            }),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      hintColor: Colors.grey,
      brightness: Brightness.light,
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
