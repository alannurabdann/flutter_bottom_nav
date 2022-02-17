import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/home/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class maps_controller extends GetxController {
  HomeController homeController = Get.find();

  void setPickedPlace(Placemark p, CameraPosition c) {
    String? name = p.name;
    String? subLocality = p.subLocality;
    String? locality = p.locality;
    String? administrativeArea = p.administrativeArea;
    String? postalCode = p.postalCode;
    String? country = p.country;
    String? address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
    homeController.address.value = address;
    homeController.latitude.value = c.target.latitude.toString();
    homeController.longitude.value = c.target.longitude.toString();
  }
}
