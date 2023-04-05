import 'dart:async';

import 'package:dio/dio.dart';
import '../repositories/ibge_repo.dart';

import '../models/models.dart';

class CepRepo {
  Future<Address?> getAddress(String cep) async {
    if (cep == null || cep.isEmpty) return Future.error('CEP Inválido');

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');

    if (clearCep.length != 8) return Future.error('CEP Inválido');

    var uri = 'http://viacep.com.br/ws/$clearCep/json';

    try {
      final response = await Dio().get<Map>(uri);

      if (response.data!.containsKey('erro') && response.data?['erro'])
        return Future.error('CEP Inválido');

      final ufList = await IBGERepo().getUFList();
      return Address(
          uf: ufList.firstWhere((u) => u.sigla == response.data!['uf']),
          cidade: Cidade(nome: response.data!['localidade']),
          bairro: response.data!['logradouro'],
          cep: response.data!['cep']);
    } catch (e) {
      Future.error('Falha ao buscar endereço');
    }
  }
}
