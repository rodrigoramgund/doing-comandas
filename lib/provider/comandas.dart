import 'dart:math';

import 'package:comandas/data/dummy_comandas.dart';
import 'package:comandas/models/comanda.dart';
import 'package:flutter/material.dart';

class Comandas with ChangeNotifier {
  final Map<String, Comanda> _items = {...DUMMY_COMANDAS};

  List<Comanda> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Comanda byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Comanda comanda) {
    if (comanda == null) {
      return;
    }

    //alterar
    if (comanda.idComanda != null &&
        comanda.idComanda.trim().isNotEmpty &&
        _items.containsKey(comanda.idComanda)) {
      _items.update(
        comanda.idComanda,
        (_) => Comanda(
          idComanda: comanda.idComanda,
          nameClient: comanda.nameClient,
          idMesa: comanda.idMesa,
        ),
      );
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Comanda(
          idComanda: id,
          nameClient: comanda.nameClient,
          idMesa: comanda.idMesa,
        ),
      );
    }
    notifyListeners(); // p que o provider seja notificado que houve mudança, e assim alterar a interface grafica
  }

  void remove(Comanda comanda) {
    if(comanda != null && comanda.idComanda != null) {
      _items.remove(comanda.idComanda);
      notifyListeners();
    }
  }
}
