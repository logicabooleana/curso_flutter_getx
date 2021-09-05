import 'package:curso_flutter_getx/controller/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.user.firstName),
              leading: IconButton(
                  icon: Icon(CupertinoIcons.back),
                  onPressed: () {
                    Get.back();
                  })),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(controller.user.email),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(onChanged:  controller.onInputTextChanged,),
                ),
                CupertinoButton(child: Text('Aceptar'), onPressed: controller.goToBackWithData  )
              ],
            ),
          ),
        );
      },
    );
  }
}
