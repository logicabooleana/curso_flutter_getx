import 'package:curso_flutter_getx/models/user.dart';
import 'package:dio/dio.dart';

class UserAPI {
  UserAPI._internal();
  static UserAPI _instance = UserAPI._internal();
  static UserAPI get instance => _instance;

  final _dio = Dio();
  Future<List<User>> getUsers(int page) async {
    try {
      final response = await this._dio.get('https://reqres.in/api/users?page=2',
          queryParameters: {'page': page});
      return (response.data['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
