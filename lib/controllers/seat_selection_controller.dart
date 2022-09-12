import 'package:get/get.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
  RxInt timeSelectedIndex = 0.obs;
  //RxInt noOfSeats = (-1.obs)as RxInt;
  static int initialValue = 1;
  RxInt noOfSeats = initialValue.obs;
  RxInt seatType = initialValue.obs;
  RxBool isSeatSelected = false.obs;
  RxList selectedSeats = [].obs;
  RxDouble seatPrice = 0.0.obs;
  RxList seatPrices = [].obs;

  RxInt seatTypeIndex = 0.obs;

  @override
  void onReady() {
    noOfSeats = initialValue.obs;
    seatType = initialValue.obs;
    super.onReady();
  }

  resetpriceandseats() {
    selectedSeats = [].obs;
    seatPrice = 0.0.obs;
    seatPrices = [].obs;
  }

  String getAssets() {
    int val = noOfSeats.value;
    if (val <= 2) {
      return 'vespa.svg';
    } else if (val > 2 && val <= 4) {
      return 'car.svg';
    } else if (val > 4 && val <= 8) {
      return 'van.svg';
    }
    return 'bus.svg';
  }

  updatenoOfSeats(int value) {
    noOfSeats = value.obs;
    update();
  }
}
