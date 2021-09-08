import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curso_flutter_getx/controller/global_controller.dart';
import 'package:curso_flutter_getx/widgets/products_list.dart';
import 'package:curso_flutter_getx/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // GetBuilder - Padre
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homecontroller) => Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                child: GetBuilder<GlobalController>(
                  id: 'favorites',
                  builder: (controller) => Text(controller.favorites.length.toString()),
                ),
              ),
            ),
          ],
        ),
        body: ProductList(), // Text(homecontroller.counter.toString())
        floatingActionButton: FloatingActionButton(
          onPressed: () => homecontroller.increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
