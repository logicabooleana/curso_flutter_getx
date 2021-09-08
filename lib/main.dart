import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curso_flutter_getx/page/reactive_page.dart';
import 'controller/global_controller.dart';
import 'controller/socket_client_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    Get.put(GlobalController());
    Get.put(SocketClientController());

    return GetMaterialApp(
      title: 'Flutter Demo con Getx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReactivePage(),
    );
  }
}
