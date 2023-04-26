
import 'package:comandas/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${product.nameProduct}"),
      subtitle: Text("R\$ ${product.price}0"),
      trailing: Container(
        width: 100,
        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.blue,
          onPressed: () {
            // _adicionarProduto(product);
          },
        ),
      ),
    );
  }

  // void _adicionarProduto(Product product) {
  //   Navigator.pop(context as BuildContext, product);
  // }
}
