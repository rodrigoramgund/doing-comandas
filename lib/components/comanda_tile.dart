import 'package:comandas/models/comanda.dart';
import 'package:comandas/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ComandaTile extends StatelessWidget {
  final Comanda comanda;

  const ComandaTile(this.comanda, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Comanda ${comanda.idComanda} /// Cliente: ${comanda.nameClient}"),
      subtitle: Text("Mesa ${comanda.idMesa}"),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.COMANDAS_CREATE,
                  arguments: comanda,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
