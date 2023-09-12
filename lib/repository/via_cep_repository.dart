import 'dart:convert';
import 'package:cep/model/via_cep_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  Future<List<ViaCepModel>> obterEnderecos(
      String estado, String cidade, String rua) async {
    String uf = estado.toLowerCase();
    String city = cidade.replaceAll(" ", "%20").toLowerCase();
    String street = rua.replaceAll(" ", "%20").toLowerCase();

    String endPonit = "https://viacep.com.br/ws/$uf/$city/$street/json/";
    debugPrint("concatenação do endereço ViaCepRepository: $endPonit");

    var response = await http.get(Uri.parse(endPonit));
    if (response.statusCode == 200) {
      var jsonEndereco = jsonDecode(response.body);
      return (jsonEndereco as List)
          .map((e) => ViaCepModel.fromJson(jsonEncode(e)))
          .toList();
    } else {
      return [];
    }
  }
}
