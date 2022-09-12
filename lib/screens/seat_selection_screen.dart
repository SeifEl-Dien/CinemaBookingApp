import '../controllers/seat_selection_controller.dart';
import '../model/movies_model.dart';
import '../model/theatre_model.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';
import '../widgets/no_of_seats.dart';
import '../widgets/seat_layout.dart';
import '../widgets/seat_type.dart';
import '../widgets/theatre_block.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TheatreModel theatreModel;
  final MovieModel movieModel;
  const SeatSelectionScreen(
      {Key? key, required this.theatreModel, required this.movieModel})
      : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      bottomNavigationBar:
          bottomBar(toggle: SeatSelectionController.instance.isSeatSelected),
      appBar: myAppBar(toggle: SeatSelectionController.instance.isSeatSelected),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(height: 15),
          Obx(
            () => SeatSelectionController.instance.isSeatSelected.value
                ? SeatLayout(model: seatLayout)
                : noOfSeatSelection(),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget myAppBar({required Function(bool) toggle}) {
    return AppBar(
      title: Text(widget.movieModel.title),
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {
              toggle(false);
              SeatSelectionController.instance.resetpriceandseats();
            },
            child: Obx(() => Text(
                  '${SeatSelectionController.instance.noOfSeats} Seats',
                  style: const TextStyle(color: Colors.white),
                )))
      ],
    );
  }

  Widget bottomBar({required Function(bool) toggle}) {
    return BottomAppBar(
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: ElevatedButton(
          onPressed: () {
            // toggle(!SeatSelectionController.instance.isSeatSelected.value);

            toggle(true);
          },
          //Get.to(() => );

          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: MyTheme.splash,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              )),
          child: Obx(
            () => Center(
                child: Text(
                    SeatSelectionController.instance.isSeatSelected.value
                        ? 'Pay ${SeatSelectionController.instance.seatPrice.value}'
                        : 'Select Seats',
                    style: const TextStyle(fontSize: 18))),
          ),
        ),
      ),
    );
  }

  Widget noOfSeatSelection() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'How many seats?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: SvgPicture.asset(
                      'assets/icons/${SeatSelectionController.instance.getAssets()}',
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  )),
              NoOfSeats(onTap: SeatSelectionController.instance.noOfSeats),
              const SizedBox(height: 10),
              SeatType(onTap: SeatSelectionController.instance.seatType)
            ],
          ),
        ),
      ),
    );
  }
}
