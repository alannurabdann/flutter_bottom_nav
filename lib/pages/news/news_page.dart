// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_resume/need_resume.dart';

import 'news_controller.dart';
import 'package:getx_app/pages/news/news_controller.dart';

import 'news_page_two.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _newspage();
}

class _newspage extends State<NewsPage>  {
  NewsController controller = Get.find();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {
  //     controller.getRandomNumber();
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    setState(() {
      controller.getRandomNumber();
    });

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
                    onPressed: () {controller.gotoNextPage();
                    }),
                Text(controller.randomNumber.value.toString()),
              ]),
        ),
      ),
    );
  }
}
