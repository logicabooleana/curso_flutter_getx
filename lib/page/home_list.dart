import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curso_flutter_getx/models/user.dart';
import 'package:curso_flutter_getx/controller/home_controller.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (controller) {
        if (controller.load) return Center(child: CircularProgressIndicator(backgroundColor: Colors.purple,));
        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (_, index) {
            final User user = controller.users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
              onTap: () => controller.showUserProfile(user: user),
            );
          },
        );
      },
    );
  }
}
