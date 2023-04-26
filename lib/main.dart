import 'package:comandas/provider/comandas.dart';
import 'package:comandas/provider/products.dart';
import 'package:comandas/routes/app_routes.dart';
import 'package:comandas/views/comandas_create.dart';
import 'package:comandas/views/comandas_list.dart';
import 'package:comandas/views/products_add_comandas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

     return MultiProvider(
      providers: [
        ChangeNotifierProvider<Comandas>(
          create: (context) => Comandas(),
        ),
        ChangeNotifierProvider<Products>(
          create: (context) => Products(),
        ),
      ],
      child: MaterialApp(
        title: "Lista de comandas",
        debugShowCheckedModeBanner: false,
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Color(0xFFFFD66D),
            secondary: Colors.deepPurple,
          ),
        ),
        routes: {
          AppRoutes.COMANDAS_LIST: (_) => ComandasList(),
          AppRoutes.COMANDAS_CREATE: (_) => ComandasCreate(),
          AppRoutes.PRODUCTS_ADD_COMANDAS: (_) => ProductsAddComandas(),
        },
      ),
    );
  }
}
