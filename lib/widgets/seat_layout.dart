/* import 'package:cinemabookingapp/controllers/seat_selection_controller.dart';
import 'package:cinemabookingapp/model/seat_layout_model.dart';
import 'package:cinemabookingapp/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SeatLayout extends StatelessWidget {
  final SeatLayoutModel model;
  SeatLayout({Key? key, required this.model}) : super(key: key);
  int alphabetCounter = 0;
  int seatCounter = 0;
  double amount = 0.0;
  @override
  Widget build(BuildContext context) {
    int seatLenght = model.seatTypes.length;
    return Expanded(
        child: Column(
      children: [
        SvgPicture.asset('assets/icons/screen_here.svg'),
        Text('Screen here'),
        SizedBox(height: 10),
        Expanded(
            child: InteractiveViewer(
          panEnabled: true,
          child: ListView.builder(
            itemCount: model.seatTypes.length,
            itemBuilder: (_, index) {
              alphabetCounter = 0;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '\$ ${model.seatTypes[seatLenght - index - 1]['price']} ${model.seatTypes[seatLenght - index - 1]['title']}'),
                      SizedBox(height: 10),
                      ...List.generate(model.rowBreaks[index], (row) {
                        alphabetCounter++;
                        seatCounter = 0;
                        String rowNo =
                            String.fromCharCode(64 + alphabetCounter);
                        return Wrap(
                            children: List.generate(model.cols, (col) {
                          if (row == model.rowBreaks[index] - 1 && col > 0) {
                            seatCounter++;

                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: size.width / 17,
                                width: size.width / 17,
                                child: Center(
                                    child: Text(
                                  '$seatCounter',
                                  style: TextStyle(color: Colors.black),
                                )),
                              ),
                            );
                          }

                          if (col == 0 && row != model.rowBreaks[index] - 1) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: size.width / 17,
                                width: size.width / 17,
                                child: Center(
                                    child: Text(String.fromCharCode(
                                        alphabetCounter + 64))),
                              ),
                            );
                          }

                          //"1st"condition gaps --"2nd" last row filled ---"3rd"the seat between the letters and numbers
                          if ((col == model.gapColIndex ||
                                      col ==
                                          model.gapColIndex + model.gap - 1) &&
                                  (row != model.rowBreaks[index] - 2 &&
                                      model.isLastFilled) ||
                              (col == 0 && row == model.rowBreaks[index] - 1)) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                color: Colors.white,
                                height: size.width / 17,
                                width: size.width / 17,
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                print('$rowNo$col');
                                RxList seats = SeatSelectionController
                                    .instance.selectedSeats;
                                if (seats.contains('$rowNo$col')) {
                                  seats.remove('$rowNo$col');
                                } else if (seats.length >=
                                    SeatSelectionController
                                        .instance.noOfSeats.value) {
                                  seats.removeAt(0);
                                  seats.add('$rowNo$col');
                                } else {
                                  seats.add('$rowNo$col');
                                }
                              },
                              child: Obx(
                                () {
                                  Color backColor = SeatSelectionController
                                          .instance.selectedSeats
                                          .contains('$rowNo$col')
                                      ? MyTheme.greenColor
                                      : Colors.white;
                                  Color borderColor = SeatSelectionController
                                          .instance.selectedSeats
                                          .contains('$rowNo$col')
                                      ? MyTheme.greenColor
                                      : Colors.black.withOpacity(0.5);
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height:
                                        size.width / 17,
                                    width:
                                        size.width / 17,
                                    decoration: BoxDecoration(
                                        color: backColor,
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                            width: 0.5, color: borderColor)),
                                  );
                                },
                              ),
                            ),
                          );
                        }));
                      })
                    ],
                  ),
                ),
              );
            },
          ),
        ))
      ],
    ));
  }
}
 */
import '../controllers/seat_selection_controller.dart';
import '../model/seat_layout_model.dart';
import '../utils/mytheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SeatLayout extends StatelessWidget {
  final SeatLayoutModel model;
  SeatLayout({Key? key, required this.model}) : super(key: key);
  int alphabetCounter = 0;
  int seatCounter = 0;
  double amount = 0.0;
  int index = SeatSelectionController.instance.seatTypeIndex.value;
  @override
  Widget build(BuildContext context) {
    int seatLenght = model.seatTypes.length;
    Size size = MediaQuery.of(context).size;

    return Expanded(
        child: Column(
      children: [
        SvgPicture.asset('assets/icons/screen_here.svg'),
        const Text('Screen here'),
        const SizedBox(height: 10),
        Expanded(
            child: InteractiveViewer(
                panEnabled: true,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '\$ ${model.seatTypes[index]['price']} ${model.seatTypes[index]['title']}'),
                          const SizedBox(height: 10),
                          ...List.generate(model.rowBreaks[index], (row) {
                            alphabetCounter++;
                            seatCounter = 0;
                            String rowNo =
                                String.fromCharCode(64 + alphabetCounter);
                            return Wrap(
                                children: List.generate(model.cols, (col) {
                              if (row == model.rowBreaks[index] - 1 &&
                                  col > 0) {
                                seatCounter++;

                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    height: size.width / 17,
                                    width: size.width / 17,
                                    child: Center(
                                        child: Text(
                                      '$seatCounter',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )),
                                  ),
                                );
                              }

                              if (col == 0 &&
                                  row != model.rowBreaks[index] - 1) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    height: size.width / 17,
                                    width: size.width / 17,
                                    child: Center(
                                        child: Text(String.fromCharCode(
                                            alphabetCounter + 64))),
                                  ),
                                );
                              }

                              //"1st"condition gaps --"2nd" last row filled ---"3rd"the seat between the letters and numbers
                              if ((col == model.gapColIndex ||
                                          col ==
                                              model.gapColIndex +
                                                  model.gap -
                                                  1) &&
                                      (row != model.rowBreaks[index] - 3 &&
                                          row != model.rowBreaks[index] - 2 &&
                                          model.isLastFilled) ||
                                  (col == 0 &&
                                      row == model.rowBreaks[index] - 1)) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    color: Colors.white,
                                    height: size.width / 17,
                                    width: size.width / 17,
                                  ),
                                );
                              }
                              return mainSeatLayout(
                                  seatPrice: SeatSelectionController
                                      .instance.seatPrice,
                                  price: model.seatTypes[index]['price'],
                                  col: col,
                                  rowNo: rowNo,
                                  size: size);
                            }));
                          })
                        ],
                      ),
                    ),
                  ),
                )))
      ],
    ));
  }

  Padding mainSeatLayout(
      {required String rowNo,
      required Size size,
      required int col,
      required Function(double) seatPrice,
      required double price}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          print('$rowNo$col');
          RxList seats = SeatSelectionController.instance.selectedSeats;
          RxList seatPriceList = SeatSelectionController.instance.seatPrices;

          if (seats.contains('$rowNo$col')) {
            //amount = amount - price;
            seatPriceList.remove(price);

            seats.remove('$rowNo$col');
          } else if (seats.length >=
              SeatSelectionController.instance.noOfSeats.value) {
            seats.removeAt(0);
            seatPriceList.removeAt(0);

            // amount = amount + price;

            seats.add('$rowNo$col');
            seatPriceList.add(price);
          } else {
            // amount = amount + price;
            seatPriceList.add(price);

            seats.add('$rowNo$col');
          }
          amount = seatPriceList.fold(0, (prev, e) => prev + e);
          seatPrice(amount < 0 ? 0.0 : amount);
        },
        child: Obx(
          () {
            Color backColor = SeatSelectionController.instance.selectedSeats
                    .contains('$rowNo$col')
                ? MyTheme.greenColor
                : Colors.white;
            Color borderColor = SeatSelectionController.instance.selectedSeats
                    .contains('$rowNo$col')
                ? MyTheme.greenColor
                : Colors.black.withOpacity(0.5);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: size.width / 17,
              width: size.width / 17,
              decoration: BoxDecoration(
                  color: backColor,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(width: 0.5, color: borderColor)),
            );
          },
        ),
      ),
    );
  }
}
