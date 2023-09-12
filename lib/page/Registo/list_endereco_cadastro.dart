// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/model/back4_app_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListEnderecoCadastro extends StatelessWidget {
  ListEnderecoCadastro({
    Key? key,
  }) : super(key: key);

  final Back4AppModel dados = Back4AppModel.fromMap(
    {
      "objectId": "4mFg93aEhe",
      "cep": "39444-184",
      "logradouro": "Rua São Joaquim",
      "complemento": "Perto da apae ",
      "bairro": "São Lucas",
      "localidade": "Janaúba",
      "uf": "MG",
      "ibge": "3135100",
      "gia": "",
      "ddd": "38",
      "siafi": "4701",
      "createdAt": "2023-09-12T18:44:42.105Z",
      "updatedAt": "2023-09-12T18:44:42.105Z"
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus registros'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      dados.localidade,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      dados.uf,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(dados.logradouro),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Bairro: ${dados.bairro}")),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Complemento: ${dados.complemento}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                dados.cep,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DDD: ${dados.ddd}"),
                  Text("IBGE: ${dados.ibge}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("GIA: ${dados.gia}"),
                  Text("SIAFI: ${dados.siafi}"),
                ],
              ),
              const Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    "Salvo em: ${DateFormat.yMd().format(DateTime.parse(dados.createdAt))}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
