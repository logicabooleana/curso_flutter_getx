import 'package:curso_flutter_getx/page/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2),()=> Get.to(HomePage(),transition: Transition.zoom));
  }
}
