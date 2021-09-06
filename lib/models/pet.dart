import 'package:get/get.dart';

//release
// convertimos una class normal en un observable con Getx

// # declaramos una clase adicional y todas sus propiedades deben ser obs
class RxPet {
  final RxString name;
  final RxInt edad;

  RxPet({required this.name, required this.edad});
}

// en esta class recibimos los datos en el formato original
class Pet {
  late RxPet rx; // instanciamos de RxPet
  Pet({
    required String name,
    required int edad,
  }) {
    // pasamos a la class RxPet sus valores obs
    this.rx = RxPet(name: name.obs, edad: edad.obs);
  }

  String get name => this.rx.name.value;
  int get edad => this.rx.edad.value;

  set name(String value) => this.rx.name.value = value;
  set edad(int value) => this.rx.edad.value = value;
}
