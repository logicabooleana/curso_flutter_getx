import 'dart:async';
import 'package:get/get.dart';
import 'package:faker/faker.dart';

// release
// Emulador de cliente de chat para eso se va a definir un observable

class SocketClientController extends GetxController {
  RxString _searchText = ''.obs;
  RxString message = ''.obs;
  Timer? _timer;
  final _faker = Faker();

  RxString get getMessage => message;

  void setSearchText(String text) => _searchText.value = text;

  @override
  void onInit() {
    super.onInit();
    // aquí vamos a simular que cada cierto tiempo recibimos un mensaje
    _init();
  }

  @override
  void onClose() {
    // aquí se van a liberar los recurso consumidos
    if (_timer != null) _timer!.cancel();

    super.onClose();
  }

  _init() {
    //* RxWorker -  Un worker permite crear un entorno en el que un bloque de código puede ejecutarse de manera paralela sin afectar al thread principal
    //  RELEASE - Ten en cuenta que se llama a RxWorker en el subproceso principal, 
    //  pero el valor que se muestre estará suscrito en un subproceso en segundo plano de forma predeterminada.
    //  Al realizar tareas de bloqueo intensivas de la CPU al mismo tiempo, libera su aislamiento principal para hacer otras cosas mientras aprovecha las capacidades de la CPU. 
    //  CASO DE USO - realizar una peticion a una DB para un busqueda automatica

    // worker 00 - Se ejecuta cada ves que ahi un cambio en el observable
    /* ever(_searchText, (_) {
      print('################### realizando una busqueda para : $_searchText');
    }); */  

    // worker 01 - Este se ejecutara una sola ves en el primer cambio
    /* once(_searchText, (_) {
      print('################### _counter has been changed ${counter.value}');
    }); */

    // worker 02 -  básicamente, cada llamada inicia un temporizador, y si ocurre otra llamada antes de que se ejecute, el temporizador se reinicia y comienza a esperar la duración deseada nuevamente. Cuando finalmente se agota el tiempo de espera del temporizador, se invoca el método de destino.
    debounce(_searchText, (_) {
      print('################### realizando una busqueda para : $_searchText');
    }, time: Duration(milliseconds: 500)); 

    // worker 03 - ah diferencia de (debounce)  este se ejecutara cada sierto tiempo
    /* interval(_searchText, (_) {
      print('################### _counter has been changed ${_searchText.value}');
    }); */

    _timer = Timer.periodic(
        Duration(seconds: 5), (_) => message.value = _faker.lorem.sentence());
  }
}
