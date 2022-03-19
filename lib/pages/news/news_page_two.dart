import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_page_three.dart';

class newsPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Page Two")),
        body: Center(
          child: ElevatedButton(
              child: Text("Page Three",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              onPressed: () {
                Get.to(() => newsPageThree());
              }),
        ));
  }
}
