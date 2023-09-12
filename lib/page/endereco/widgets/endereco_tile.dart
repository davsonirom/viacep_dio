import 'package:cep/repository/back4_app_repository.dart';
import 'package:flutter/material.dart';

import 'package:cep/model/via_cep_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class EnderecoTile extends StatelessWidget {
  final ViaCepModel viaCepModel;

  EnderecoTile({
    Key? key,
    required this.viaCepModel,
  }) : super(key: key);

  Back4AppRepository back4appRepository = Back4AppRepository();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: Text(viaCepModel.logradouro),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viaCepModel.cep,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(viaCepModel.bairro),
        ],
      ),
      trailing: IconButton(
        onPressed: () async {
          String enderecoToBack4app = viaCepModel.toJson();
          debugPrint("string para back4App: $enderecoToBack4app");
          Response status =
              await back4appRepository.salvarEndereco(enderecoToBack4app);
          debugPrint(status.statusCode.toString());
        },
        icon: const FaIcon(FontAwesomeIcons.solidFloppyDisk),
      ),
    );
  }
}
