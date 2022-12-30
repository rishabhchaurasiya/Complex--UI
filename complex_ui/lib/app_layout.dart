import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    // var modifiedPixels =pixels - pixels * 0.1;
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    // var modifiedPixels =pixels - pixels * 0.1;
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}
