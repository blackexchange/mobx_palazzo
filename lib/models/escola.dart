import 'package:google_maps_flutter/google_maps_flutter.dart';

class Escola {
  String? id;
  String? nome;
  LatLng? localizacao;

  Escola({this.id, this.nome, this.localizacao});

  factory Escola.fromJson(String key, Map json) {
    final loc = json['localidade'].toJson();

    return Escola(
        id: key,
        nome: json['nome'],
        localizacao: LatLng(loc['latitude'], loc['longitude']));
  }

  @override
  String toString() {
    return 'Escola {id:$id, nome:$nome}';
  }
}
