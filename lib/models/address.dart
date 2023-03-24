import './models.dart';

class Address {
  UF uf;
  Cidade cidade;
  String bairro;
  String cep;

  Address(
      {required this.uf,
      required this.cidade,
      required this.bairro,
      required this.cep});

  factory Address.fromJson(Map json) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return Address(
        uf: json['uf'],
        cidade: json['cidade'],
        bairro: json['bairro'],
        cep: json['cep']);
  }

  @override
  String toString() {
    return "Endereço{ uf:$uf, cidade:$cidade, bairro:$bairro, cep:$cep}";
  }
}
