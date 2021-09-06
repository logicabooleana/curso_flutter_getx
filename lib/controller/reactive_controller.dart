import 'package:curso_flutter_getx/models/pet.dart';
import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt count = 0.obs;
  RxString currentDate = ''.obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;
  Pet myPet = Pet(name: '', edad: 5);

  void increment() => this.count.value++;
  void getDate() => this.currentDate.value = DateTime.now().toString();
  void removeMapItem({required String key}) => this.mapItems.remove(key);
  void setPetAge(int age) => myPet.edad=age;
  void addMapItem() {
    String key = DateTime.now().toString();
    this.mapItems[key] = key;
  }


}
