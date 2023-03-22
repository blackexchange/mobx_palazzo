class Turma {
  final String? id;
  late final String title;
  late final String desc;
  late final bool active;

  Turma({
    this.id,
    required this.title,
    required this.desc,
    required this.active,
  });

  factory Turma.fromJson(String key, Map json) {
    /* if (!json.keys.toSet().containsAll(['profile'])) {
      throw Exception();
    }*/

    return Turma(
        id: key,
        title: json['title'],
        desc: json['desc'],
        active: json['active']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'active': active,
      };
}
