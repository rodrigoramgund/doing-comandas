
import 'package:comandas/data/dummy_products.dart';
import 'package:comandas/models/comanda.dart';
import 'package:comandas/models/product.dart';
import 'package:comandas/provider/comandas.dart';
import 'package:comandas/provider/products.dart';
import 'package:comandas/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_comandas.dart';

// class ComandasCreate extends StatelessWidget {
//   final _form = GlobalKey<FormState>();
//   final Map<String, Object> _formData = {};
//
//   final Map<String, Product> _items = {...DUMMY_PRODUCTS};
//
//   @override
//   Widget build(BuildContext context) {
//     final Products products = Provider.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Temperos do Sertão',
//           textAlign: TextAlign.center,
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               final isValid = _form.currentState?.validate();
//
//               if (isValid == true) {
//                 _form.currentState?.save();
//
//                 Provider.of<Comandas>(context, listen: false).put(
//                   Comanda(
//                     idComanda: _formData['idComanda'] as String,
//                     nameClient: _formData['nameClient'] as String,
//                     idMesa: _formData['idMesa'] as String,
//                   ),
//                 );
//                 Navigator.of(context).pop();
//               }
//             },
//             icon: Icon(Icons.save),
//           )
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 16.0, top: 24.0, bottom: 0.0),
//             child: Text(
//               "Criar Comanda",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w600,
//               ),
//               textAlign: TextAlign.start,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _form,
//               child: Column(
//                 children: <Widget>[
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Cliente:"),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "Nome inválido";
//                       }
//                       if (value.trim().length < 2) {
//                         return "Nome muito pequeno. No mínimo 2 letras.";
//                       }
//                     },
//                     onSaved: (value) =>
//                         _formData['nameClient'] = value as Object,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(labelText: "Mesa:"),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return "Mesa inválida";
//                         }
//                       },
//                       onSaved: (value) => _formData['idMesa'] = value as Object,
//                     ),
//                   ),
//                   // Expanded(
//                   //   child: ListView.builder(
//                   //     itemCount: products.count,
//                   //     itemBuilder: (ctx, i) => ProductItem(products.byIndex(i)),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           // SizedBox(
//           //   child: Row(
//           //     children: [
//           //       TextField(
//           //         decoration: InputDecoration(
//           //           prefixIcon: Icon(Icons.search),
//           //           border: OutlineInputBorder(),
//           //           hintText: 'Pesquise aqui um item',
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

class ComandasCreate extends StatefulWidget {
  const ComandasCreate({Key? key}) : super(key: key);

  @override
  State<ComandasCreate> createState() => _ComandasCreateState();
}

class _ComandasCreateState extends State<ComandasCreate> {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  final Map<String, Comanda> _itemsComandas = {...DUMMY_COMANDAS};
  final Map<String, Product> _items = {...DUMMY_PRODUCTS};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Temperos do Sertão',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid == true) {
                _form.currentState?.save();

                Provider.of<Comandas>(context, listen: false).put(
                  Comanda(
                    idComanda: _formData['idComanda'] as String,
                    nameClient: _formData['nameClient'] as String,
                    idMesa: _formData['idMesa'] as String,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 24.0, bottom: 0.0),
            child: Text(
              "Criar Comanda",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Nº da Comanda: ',
                    ),
                    initialValue: (_itemsComandas.length + 1).toString(),
                    onSaved: (value) =>
                        _formData['idComanda'] = value as Object,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Cliente:"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Nome inválido";
                      }
                      if (value.trim().length < 2) {
                        return "Nome muito pequeno. No mínimo 2 letras.";
                      }
                    },
                    onSaved: (value) =>
                        _formData['nameClient'] = value as Object,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Mesa:"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Mesa inválida";
                        }
                      },
                      onSaved: (value) => _formData['idMesa'] = value as Object,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(child: Text("oi"),),
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 16.0, 0, 16.0),
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                heroTag: 'btn1',
                onPressed: () {},
                child: Icon(Icons.task_alt),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                heroTag: 'btn2',
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PRODUCTS_ADD_COMANDAS,
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
