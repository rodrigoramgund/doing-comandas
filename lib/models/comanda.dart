import 'package:comandas/models/product.dart';

class Comanda {
  final String idComanda;
  final String nameClient;
  final String idMesa;
  List<Product> items = [];

  Comanda({
    required this.idComanda,
    required this.nameClient,
    required this.idMesa,
  });
}