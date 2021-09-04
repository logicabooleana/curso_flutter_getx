import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;
  int get counter => _counter;
  void increment() {this._counter++;update();}
}
