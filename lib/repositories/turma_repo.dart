import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class TurmaRepo {
  Future<List<Turma>> getList(String escolaId) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('Turmas'));
    final t = ParseObject('Escola');
    t.objectId = escolaId;

    queryBuilder.whereEqualTo("escola", t.toPointer());
    queryBuilder..orderByAscending('title');
    queryBuilder.includeObject(['escola']);
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
          .map((e) => Turma.fromJson(e.objectId!, e.toJson(), e: e))
          .toList();

      return parsed;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
