import 'dart:convert';

import 'package:curso_flutter_getx/models/product.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  Map<String, Product> _favorites = Map();

  Map<String, Product> get favorites => _favorites;
  List<Product> get products => _products;

  @override
  void onInit() {
    super.onInit();
    print('########### Global - onInit(){_loadProducts}');
    _loadProducts();
  }

  void onFavorite({required int index, required bool isFavorite}) {
    Product product = this._products[index];
    product.isFavorite = isFavorite;
    if (isFavorite) {
      this._favorites[product.name] = product;
    } else {
      this._favorites.remove(product.name);
    }
    update(['products','favorites']); // actualizamos las vistas
  }

  Future<void> _loadProducts() async {
    // leemos el archivo json y obtendremos una lista de productos
    final String productsString =
        await rootBundle.loadString('assets/products.json');
    // convert list of dynamic
    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    update(['products']); // actualizamos las vistas
  }
}
