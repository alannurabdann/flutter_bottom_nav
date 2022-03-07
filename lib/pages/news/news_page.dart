import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_controller.dart';

class NewsPage extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              controller.branch.value,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Obx(
            () => Text(
              controller.greetings.value,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
              onPressed: () {
                controller.fetchData();
              },
              child: Text("Refresh"))
        ],
      ),
    ));
  }
}
