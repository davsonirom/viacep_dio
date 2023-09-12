import 'dart:convert';
import 'dart:io';

import 'package:cep/model/via_cep_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Back4AppRepository {
  //* Request
  // https://parseapi.back4app.com/classes/endereco
  // Headers
  // X-Parse-Application-Id: QcvQjD8mYkc8CvKlH8zlifGRGIehyTauOJV6bfyd
  // X-Parse-REST-API-Key: aIQWt0omfIncXSPfkqd7ZMsa4TYuQNPVUSikLVYz
  // Content-Type: application/json

  Future salvarEndereco(String endereco) async {
    String endPoint = "https://parseapi.back4app.com/classes/endereco";
    final response = await http.post(
      Uri.parse(endPoint),
      headers: {
        'X-Parse-Application-Id': 'QcvQjD8mYkc8CvKlH8zlifGRGIehyTauOJV6bfyd',
        'X-Parse-REST-API-Key': 'aIQWt0omfIncXSPfkqd7ZMsa4TYuQNPVUSikLVYz',
        'Content-Type': 'application/json'
      },
      body: (endereco),
    );

    return response;
  }
}
