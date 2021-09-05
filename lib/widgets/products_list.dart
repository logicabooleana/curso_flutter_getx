import 'package:curso_flutter_getx/controller/global_controller.dart';
import 'package:curso_flutter_getx/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (_, index) {
            final Product product = controller.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(onPressed: ()=>controller.onFavorite(index: index, isFavorite: !product.isFavorite), icon: Icon(Icons.favorite,color: product.isFavorite?Colors.red:Colors.grey,)),
            );
          },
        );
      },
    );
  }
}
