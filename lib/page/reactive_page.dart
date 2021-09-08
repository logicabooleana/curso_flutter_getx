import 'package:curso_flutter_getx/controller/reactive_controller.dart';
import 'package:curso_flutter_getx/controller/socket_client_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accedemos al controlador global
    final SocketClientController socketClientController =
        Get.find<SocketClientController>();

    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Obx(() => Text('age: ${controller.myPet.edad}')),
                Obx(() => Text('age: ${socketClientController.message}')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CupertinoTextField(
                    padding: EdgeInsets.all(12),
                    onChanged: (text) => socketClientController.setSearchText(text),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      controller.setPetAge(controller.myPet.edad + 1);
                    },
                    child: Text('Set edad'))
              ],
            ),
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
