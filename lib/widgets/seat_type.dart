import '../controllers/seat_selection_controller.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatType extends StatelessWidget {
  final Function(int) onTap;
  const SeatType({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
          alignment: WrapAlignment.spaceAround,
          children: List.generate(
              seatLayout.seatTypes.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      onTap(index + 1);
                      SeatSelectionController.instance.seatTypeIndex =
                          index.obs;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index + 1 ==
                                  SeatSelectionController
                                      .instance.seatType.value
                              ? MyTheme.greenColor
                              : const Color(0xfffcfcfc),
                          border: Border.all(
                              width: 0.5,
                              color: index + 1 ==
                                      SeatSelectionController
                                          .instance.seatType.value
                                  ? MyTheme.greenColor
                                  : const Color(0xffe5e5e5))),
                      child: Column(
                        children: [
                          Text(
                            seatLayout.seatTypes[index]['title'],
                            style: TextStyle(
                              color: index + 1 ==
                                      SeatSelectionController
                                          .instance.seatType.value
                                  ? Colors.white
                                  : Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '\$ ${seatLayout.seatTypes[index]['price']}',
                            style: TextStyle(
                                color: index + 1 ==
                                        SeatSelectionController
                                            .instance.seatType.value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            seatLayout.seatTypes[index]['status'],
                            style: TextStyle(
                              color: index + 1 ==
                                      SeatSelectionController
                                          .instance.seatType.value
                                  ? Colors.white
                                  : Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )))),
    );
  }
}
