import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValidator {
  static bool validateField(String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar('Error', 'Complete all the fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));

    return false;
  }

  static bool validatepassword(String value1, String value2) {
    if (value1.trim() == value2.trim()) {
      return true;
    }
    Get.snackbar('Error', 'Confirm password do not match the password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));

    return false;
  }
}
