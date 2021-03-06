import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var title = "Home";
  var counter = 109.obs;
  var logger = Logger();

  void changeTabIndex(int index) {
    tabIndex = index;
    switch (tabIndex) {
      case 0:
        title = "Home";
        break;
      case 1:
        title = "News";
        break;
      case 2:
        title = "Notification";
        break;
      case 3:
        title = "Profile";
        break;
      default:
        break;
    }
    update();
  }

  void addCounter(){
    this.counter.value += 1;
  }

  void minusCounter(){
    this.counter.value -= 1;
  }
}
