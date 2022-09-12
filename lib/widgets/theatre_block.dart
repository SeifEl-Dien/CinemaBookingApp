import '../controllers/calendar_controller.dart';
import '../controllers/location_controller.dart';
import '../controllers/seat_selection_controller.dart';
import '../model/theatre_model.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TheatreBlock extends StatelessWidget {
  final TheatreModel model;
  final bool isBooking;
  final Function(int) onTimeTap;

  const TheatreBlock({
    Key? key,
    required this.model,
    this.isBooking = false,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var instance = CalendarController.instance;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name.length > 38
                    ? '${model.name.substring(0, 38)} ...'
                    : model.name,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.62),
                      context: context,
                      builder: (_) => facilitesBottomSheet(size));
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black45.withOpacity(0.3),
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          isBooking
              ? Text(instance.format.format(instance.selectedMovieDate.value),
                  style: const TextStyle(color: Colors.black45))
              : RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.black45,
                        ),
                      ),
                      TextSpan(
                          text: '${LocationController.instance.city.value}, ',
                          style: const TextStyle(color: Colors.black45)),
                      const TextSpan(
                          text: '2.3 km Away',
                          style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10,
              spacing: 20,
              children: List.generate(
                4,
                (index) {
                  bool isSelected = index ==
                          SeatSelectionController
                              .instance.timeSelectedIndex.value &&
                      isBooking;
                  Color color =
                      index % 2 == 0 ? MyTheme.orangeColor : MyTheme.greenColor;
                  return GestureDetector(
                    onTap: () {
                      onTimeTap(index);
                      SeatSelectionController.instance.timeSelectedIndex =
                          index.obs;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: isSelected
                              ? MyTheme.greenColor
                              : const Color(0x22E5E5E5),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1,
                              color: isSelected
                                  ? MyTheme.greenColor
                                  : const Color(0xFFE5E5E5))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        model.timings[index],
                        style:
                            TextStyle(color: isSelected ? Colors.white : color),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack facilitesBottomSheet(Size size) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.3))),
                  height: size.height * 0.18,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/map.png',
                      fit: BoxFit.fitWidth,
                      width: size.width,
                    ),
                  )),
              const SizedBox(height: 10),
              Text(model.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18)),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.location_on,
                        size: 25,
                        color: Colors.black45,
                      ),
                    ),
                    TextSpan(
                        text: LocationController.instance.city.value,
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Text(model.fullAddress,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                  )),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child:
                    Text('Available Facilites', style: TextStyle(fontSize: 14)),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.facilites.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index != model.facilites.length - 1
                              ? size.width / 4 - 65
                              : 0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: MyTheme.redGiftGradientColors[0]),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                facilityAsset[index],
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                          Text(model.facilites[index],
                              style: const TextStyle(color: Colors.black45)),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: MyTheme.splash,
            child: SvgPicture.asset(
              'assets/icons/gps.svg',
              height: 40,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
}
