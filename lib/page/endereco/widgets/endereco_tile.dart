import 'package:flutter/material.dart';

import 'package:cep/model/via_cep_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EnderecoTile extends StatelessWidget {
  final ViaCepModel viaCepModel;

  const EnderecoTile({
    Key? key,
    required this.viaCepModel,
  }) : super(key: key);

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
        onPressed: () {},
        icon: const FaIcon(FontAwesomeIcons.solidFloppyDisk),
      ),
    );
  }
}
