

import 'package:flutter/material.dart';
import 'package:curso_flutter_getx/controller/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(id: 'count',builder: (controller) => Text(controller.counter.toString()));
  }
}