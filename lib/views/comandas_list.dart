import 'package:comandas/components/comanda_tile.dart';
import 'package:comandas/models/comanda.dart';
import 'package:comandas/provider/comandas.dart';
import 'package:comandas/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComandasList extends StatelessWidget {
  const ComandasList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Comandas comandas = Provider.of(context); //listen false mesmo com o notifyListener, ele nao vai
    //atualizar a interface grafica (a partir da açao do botao) quando houver uma mudança

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
                "Lista de Comandas",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comandas.count,
                itemBuilder: (ctx, i) => ComandaTile(comandas.byIndex(i)),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.COMANDAS_CREATE,
            );
          },
          child: Icon(Icons.add),
        ),
    );
  }
}
