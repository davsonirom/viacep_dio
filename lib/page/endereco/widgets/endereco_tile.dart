import 'package:cep/repository/back4_app_repository.dart';
import 'package:flutter/material.dart';

import 'package:cep/model/via_cep_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class EnderecoTile extends StatefulWidget {
  const EnderecoTile({
    Key? key,
    required this.viaCepModel,
  }) : super(key: key);

  final ViaCepModel viaCepModel;

  @override
  State<EnderecoTile> createState() => _EnderecoTileState();
}

class _EnderecoTileState extends State<EnderecoTile> {
  Back4AppRepository back4appRepository = Back4AppRepository();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: Text(widget.viaCepModel.logradouro),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.viaCepModel.cep,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(widget.viaCepModel.bairro),
        ],
      ),
      trailing: IconButton(
        onPressed: () async {
          final back4app =
              await back4appRepository.jaExisteOEndereco(widget.viaCepModel);
          if (back4app) {
            debugPrint(
                "verificado dados existente: CEP ja cadastrado no back4App.");
          } else {
            String enderecoToBack4app = widget.viaCepModel.toJson();
            debugPrint("string para back4App: $enderecoToBack4app");
            Response status =
                await back4appRepository.salvarEndereco(enderecoToBack4app);
            debugPrint(status.statusCode.toString());
          }
        },
        icon: const FaIcon(FontAwesomeIcons.solidFloppyDisk),
      ),
    );
  }
}
