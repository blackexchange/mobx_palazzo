import 'escola.dart';

class Turma {
  final String? id;
  late final String title;
  late final String desc;
  late final bool active;
  Escola? escola;

  Turma({
    this.id,
    required this.title,
    required this.desc,
    required this.active,
    this.escola,
  });

  factory Turma.fromJson(String key, Map json, {dynamic e}) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return Turma(
        id: key,
        title: json['title'],
        desc: json['desc'],
        active: json['active'],
        escola: Escola.fromJson(
            json['escola']['objectId'], e.get('escola').toJson()));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'active': active,
      };
}
