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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('age: ${controller.myPet.edad}')),
              TextButton(
                  onPressed: () {
                    controller.setPetAge(controller.myPet.edad+1);
                  },
                  child: Text('Set edad'))
            ],
          ),
          /* body: Obx(() {
            return ListView(
              children: controller.mapItems.values
                  .map(
                    (e) => ListTile(
                      title: Text(e),
                      trailing: IconButton(
                          onPressed: () {
                            controller.removeMapItem(key: e);
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  )
                  .toList(),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.addMapItem(),
            child: Icon(Icons.add),
          ), */
        );
      },
    );
  }
}
