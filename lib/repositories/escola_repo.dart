import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class EscolaRepo {
  Future<List<Escola>> getList() async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject('Escola'))
      ..orderByAscending('nome');

    final response = await queryBuilder.query();

    if (response.success) {
      final List<Escola> parsed = response.results!
          .map((e) => Escola.fromJson(e.objectId!, e.toJson()))
          .toList();

      return parsed;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
