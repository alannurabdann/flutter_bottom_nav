// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/alerts/alerts_page.dart';

import 'news_controller.dart';
import 'package:getx_app/pages/news/news_controller.dart';

import 'news_page_two.dart';

class NewsPage extends StatelessWidget {
  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    child: Text("Page Two",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                    ),
                    onPressed: () {
                      controller.gotoNextPage();
                    }),
                randomWidget(),
              ]),
        ),
      ),
    );
  }
}

class randomWidget extends StatelessWidget {
  NewsController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      initState: (_) {c.getRandomNumber();},
      dispose: (_) {c.getRandomNumber();},
      builder: (_) => Text(c.randomNumber.string),
    );
  }
}
