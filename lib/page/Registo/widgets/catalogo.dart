// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cep/model/back4_app_model.dart';

class Catalago extends StatelessWidget {
  const Catalago({
    Key? key,
    required this.dados,
  }) : super(key: key);

  final Back4AppModel dados;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
