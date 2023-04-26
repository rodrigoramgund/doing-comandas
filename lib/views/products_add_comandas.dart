import 'package:comandas/components/product_tile.dart';
import 'package:comandas/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsAddComandas extends StatelessWidget {
  const ProductsAddComandas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Temperos do Sertão',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 24.0, bottom: 8.0),
            child: Text(
              "Adicionar Produto na Comanda",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.count,
              itemBuilder: (ctx, i) => ProductTile(products.byIndex(i)),
            ),
          ),
        ],
      ),
    );
  }
}
