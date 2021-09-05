import 'package:curso_flutter_getx/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late User _user;
  User get user => _user;

  String _inputText = '';
  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    // trim() - Si la cadena contiene espacios en blanco iniciales o finales, se devuelve una nueva cadena sin espacios en blanco iniciales ni finales
    if (this._inputText.trim().length > 0) {
      // devolvemos un resultado
      Get.back(result: this._inputText);
    } else {
      Get.dialog(AlertDialog(title: Text('ERROR'),content: Text('Ingrese un valor valido'),actions: [TextButton(onPressed: ()=>Get.back(), child: Text('Aceptar'))],));
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Recibimos datos por argumento
    this._user = Get.arguments as User; // casteamos el mapa con la clase User
  }
}
