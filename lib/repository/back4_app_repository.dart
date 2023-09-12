import 'dart:convert';

import 'package:cep/model/via_cep_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/back4_app_model.dart';

class Back4AppRepository {
  String endPoint = "https://parseapi.back4app.com/classes/endereco";
  Map<String, String> cabecalho = {
    'X-Parse-Application-Id': 'QcvQjD8mYkc8CvKlH8zlifGRGIehyTauOJV6bfyd',
    'X-Parse-REST-API-Key': 'aIQWt0omfIncXSPfkqd7ZMsa4TYuQNPVUSikLVYz',
    'Content-Type': 'application/json'
  };
  //* Request
  // https://parseapi.back4app.com/classes/endereco
  // Headers
  // X-Parse-Application-Id: QcvQjD8mYkc8CvKlH8zlifGRGIehyTauOJV6bfyd
  // X-Parse-REST-API-Key: aIQWt0omfIncXSPfkqd7ZMsa4TYuQNPVUSikLVYz
  // Content-Type: application/json

//! salvar
  Future salvarEndereco(String endereco) async {
    final response = await http.post(
      Uri.parse(endPoint),
      headers: cabecalho,
      body: (endereco),
    );

    return response;
  }

//! ler

//! consulta com condicao
  Future<bool> jaExisteOEndereco(ViaCepModel endereco) async {
    String parametros = "where={\"cep\": \"${endereco.cep}\"}";
    final String urlWhere = "$endPoint?$parametros";
    debugPrint("Url para query where: $urlWhere");
    final response = await http.get(Uri.parse(urlWhere), headers: cabecalho);
    final ceps = jsonDecode(response.body);

    if (ceps.toString().contains(endereco.cep)) {
      return true;
    } else {
      return false;
    }
  }

//! apagar
  Future<void> apagarEnderecoEmback4App(ViaCepModel endereco) async {
    await http.delete(Uri.parse(endPoint + endereco.gia));
  }
}
