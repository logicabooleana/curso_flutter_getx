import 'package:curso_flutter_getx/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homecontroller) => Scaffold(
        body: Center(child: Text(homecontroller.counter.toString())),
        floatingActionButton: FloatingActionButton(
          onPressed: () => homecontroller.increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
