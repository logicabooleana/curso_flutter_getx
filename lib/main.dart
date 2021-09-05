import 'package:curso_flutter_getx/page/reactive_page.dart';
import 'package:curso_flutter_getx/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/global_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReactivePage(),
    );
  }
}
