import 'package:curso_flutter_getx/page/home_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2),()=> Get.off(HomePage(),transition: Transition.zoom));
  }
}
