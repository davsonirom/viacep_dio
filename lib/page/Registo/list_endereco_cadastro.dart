// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cep/model/back4_app_model.dart';

import 'widgets/catalogo.dart';

class ListEnderecoCadastro extends StatelessWidget {
  const ListEnderecoCadastro({
    Key? key,
    required this.registros,
  }) : super(key: key);
  final List<Back4AppModel> registros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus registros'),
      ),
      body: ListView.builder(
        itemCount: registros.length,
        itemBuilder: (_, index) {
          Back4AppModel dado = registros[index];
          return Catalago(
            dados: dado,
          );
        },
      ),
    );
  }
}
