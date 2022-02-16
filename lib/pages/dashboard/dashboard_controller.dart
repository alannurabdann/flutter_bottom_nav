import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var title = "Home";

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
}
