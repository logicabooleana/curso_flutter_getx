import 'dart:async';

import 'package:curso_flutter_getx/models/pet.dart';
import 'package:get/get.dart';
import 'socket_client_controller.dart';

class ReactiveController extends GetxController {

  RxInt count = 0.obs;
  RxString currentDate = ''.obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;
  Pet myPet = Pet(name: '', edad: 5);
  late StreamSubscription<String> streamSubscription;

  void increment() => this.count.value++;
  void getDate() => this.currentDate.value = DateTime.now().toString();
  void removeMapItem({required String key}) => this.mapItems.remove(key);
  void setPetAge(int age) => myPet.edad = age;
  void addMapItem() {
    String key = DateTime.now().toString();
    this.mapItems[key] = key;
  }

  @override
  void onInit() {
    super.onInit();
    // Accedemos al controllador
    final SocketClientController socketClientController = Get.find<SocketClientController>();
    // aquí vamos a escuchar todos los cambios que ocurran en SocketClientController()
    streamSubscription = socketClientController.getMessage.listen((data) => /* print('############################  message: $data') */null);
  }

  @override
  void onClose() {
    // cancelamos las subcriciones
    streamSubscription.cancel();

    super.onClose();
  }
}
