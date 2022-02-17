import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/dashboard/dashboard_controller.dart';

class AddAlertPage extends StatelessWidget {

  DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Counter"),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 56, right: 16, left: 16),
          child: Center(
            child: Column(
              children: [
                Obx(() => Text(
                    "Alert Count : ${controller.counter.value.toString()} ")),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: Text("Kurangin Aja"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          controller.minusCounter();
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextButton(
                        child: Text("Tambahin Lah"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          controller.addCounter();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
