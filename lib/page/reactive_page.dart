import 'package:curso_flutter_getx/controller/reactive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (controller) {
        return Scaffold(
          body: Center(child: Obx(()=>Text(controller.count.value.toString()))),
          floatingActionButton: FloatingActionButton(onPressed: ()=>controller.increment(),child: Icon(Icons.add),),
        );
      },
    );
  }
}
