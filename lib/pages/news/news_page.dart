import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_controller.dart';
import 'package:getx_app/logins/login_page.dart';
import 'package:getx_app/pages/categories/category_page.dart';
import 'package:getx_app/pages/news/news_controller.dart';

class NewsPage extends GetView<NewsController> {
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
                    child: Text("Goto Login",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                    ),
                    onPressed: () {
                      Get.to(LoginPage());
                    }),
                ElevatedButton(
                    child: Text("Goto Categories",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      Get.to(() => CategoryPage());
                    }),
              ]),
        ),
      ),
    );
  }
}
