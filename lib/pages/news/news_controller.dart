import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/news/news_page_two.dart';

class NewsController extends GetxController {

  var branch = "branch default".obs;
  var greetings = "greetings default".obs;
  var randomNumber = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await Firebase.initializeApp();
    setupRemoteConfig().then((value) => setValue(value));
  }

  void setValue(FirebaseRemoteConfig rconfig){
      branch.value = rconfig.getString('BRANCH').toString();
      greetings.value = rconfig.getString('GREETINGS').toString();
      //update();
  }

  Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    final FirebaseRemoteConfig remoteConfig =  FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    await remoteConfig.setDefaults(<String, dynamic>{
      'BRANCH': 'default branch',
      'GREETINGS': 'default greetings',
    });
    RemoteConfigValue(null, ValueSource.valueStatic);
    return remoteConfig;
  }

  void fetchData() async {
   final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    try {
      // Using zero duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate().then((value) => setValue(remoteConfig));
    } on PlatformException catch (exception) {
      // Fetch exception.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
      print(exception);
    }
  }

  void getRandomNumber(){
      var random = new Random();
 
    // Printing Random Number between 1 to 100 on Terminal Window.
    randomNumber.value =  random.nextInt(100);
  }

  void gotoNextPage(){
    Get.to(() => newsPageTwo());
  }

}
