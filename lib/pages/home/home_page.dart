import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/home/home_controller.dart';
import 'package:getx_app/pages/maps/maps_page.dart';

class HomePage extends StatelessWidget {

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                child: Text("Pick a place"),
                onPressed: () {
                  Get.to(MapPage());
                }),
            SizedBox(height: 16.0),
            Obx(() => Text(
              "Longitude : " + controller.longitude.value,
              style: TextStyle(fontSize: 20),
            )),
            Divider(),
            Obx(() => Text(
              "Latitude : " + controller.latitude.value,
              style: TextStyle(fontSize: 20),
            )),
            Divider(),
            Obx(() => Text(
              "Address : " + controller.address.value,
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
