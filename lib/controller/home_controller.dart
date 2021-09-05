import 'package:curso_flutter_getx/api/users_api.dart';
import 'package:curso_flutter_getx/page/profile_page.dart';
import 'package:get/get.dart';
import 'package:curso_flutter_getx/models/user.dart';

class HomeController extends GetxController {
  bool _loading = true;
  int _counter = 0;
  List<User> _users = [];
  int get counter => _counter;
  List<User> get users => _users;
  bool get load => _loading;

  void increment() {
    this._counter++;
    update(['count']);
  }

  Future<void> loadUsers() async {
    final data = await UserAPI.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  Future<void> showUserProfile({required User user}) async {
    // pasamos datos por argumentos a una nueva página
    final result = await Get.to<String>(ProfilePage(), arguments: user);
    if (result != null) print('#################### obtuvimos un resultado');
  }

  @override
  void onInit() {
    super.onInit();
    print('#################### onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('#################### onReady(){loadUsers}');
    this.loadUsers();
  }
}
