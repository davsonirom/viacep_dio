// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cep/model/via_cep_model.dart';

import 'widgets/endereco_tile.dart';

class EnderecoPage extends StatelessWidget {
  const EnderecoPage({
    Key? key,
    required this.enderecosEncontrados,
    required this.cidade,
  }) : super(key: key);
  final List<ViaCepModel> enderecosEncontrados;
  final String cidade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CEPs de $cidade'),
      ),
      body: ListView.builder(
        itemCount: enderecosEncontrados.length,
        itemBuilder: (_, index) {
          var resultado = enderecosEncontrados[index];
          return EnderecoTile(
            viaCepModel: resultado,
          );
        },
      ),
    );
  }
}
