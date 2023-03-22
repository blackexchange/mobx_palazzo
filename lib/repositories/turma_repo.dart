import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class TurmaRepo {
  Future<List<Turma>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject('Turmas'))
      ..orderByAscending('title');
    /*
      function userHasRole(user, roleName) {
    var query = new Parse.Query(Parse.Role);
    query.equalTo("name", roleName);
    query.equalTo("users", user);
    return query.find().then(function(roles) {
        return roles.length > 0;
    });*/

    final response = await queryBuilder.query();

    if (response.success) {
      final List<Turma> parsed = response.results!
          .map((e) => Turma.fromJson(e.objectId!, e.toJson()))
          .toList();

      return parsed;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
