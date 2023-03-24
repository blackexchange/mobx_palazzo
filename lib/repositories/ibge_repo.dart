import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

class IBGERepo {
  Future<List<UF>> getUFList() async {
    SharedPreferences? pref = await SharedPreferences.getInstance();

    if (pref.containsKey("UF_LIST")) {
      final j = jsonDecode(pref.get('UF_LIST') as String);

      return j.map<UF>((e) => UF.fromJson(e)).toList()
        ..sort((UF a, UF b) =>
            a.nome!.toLowerCase().compareTo(b.nome!.toLowerCase()));
    }

    const uri = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(uri);

      pref.setString("UF_LIST", jsonEncode(response.data));

      final ufList = response.data?.map<UF>((e) => UF.fromJson(e)).toList()
        ?..sort(
            (a, b) => a.nome!.toLowerCase().compareTo(b.nome!.toLowerCase()));

      return ufList!;
    } on DioError {
      return Future.error('Falha ao obter lista de Estados');
    }
  }

  Future<List<Cidade>> getCityList(UF uf) async {
    var uri =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(uri);

      final objList = response.data
          ?.map<Cidade>((e) => Cidade.fromJson(e))
          .toList()
        ?..sort(
            (a, b) => a.nome!.toLowerCase().compareTo(b.nome!.toLowerCase()));

      return objList!;
    } on DioError {
      return Future.error('Falha ao obter lista de Cidades');
    }
  }
}
