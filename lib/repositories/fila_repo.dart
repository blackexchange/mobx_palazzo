import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class FilaRepo {
  Future<List<Fila>?> getFila() async {
    final q = QueryBuilder<ParseObject>(ParseObject('Fila'));
    q.includeObject(
        ['responsavel', 'matricula.turma.escola', 'matricula.owner']);

    q.whereNotEqualTo('status', FilaStatus.SAIUDAFILA.index);
    q.orderByAscending('createdAt');
    final apiResponse = await q.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results
          ?.map((e) => Fila.fromJson(e.objectId!, e.toJson(), e: e))
          .toList();
    } else {
      return [];
    }
  }

  Future save(Fila f) async {
    try {
      ParseUser currentUser = ParseUser.forQuery();
      currentUser.objectId = f.responsavel?.id;

      final filaObj = ParseObject('Fila');
      final ParseObject matricula = ParseObject('Matriculas');
      matricula.objectId = f.matricula?.id;

      final parseACL = ParseACL(owner: currentUser);
      parseACL.setPublicReadAccess(allowed: false);
      parseACL.setPublicWriteAccess(allowed: false);

      filaObj.setACL(parseACL);
      filaObj.set<ParseObject?>('matricula', matricula);

      filaObj.set<String?>('aluno', f.matricula?.nome);
      // filaObj.set<String?>('aluno', f.matricula?.nome);
      filaObj.set<ParseUser?>('responsavel', currentUser);
      filaObj.set<int>('status', FilaStatus.NAFILA.index);

      final response = await filaObj.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future update(String id) async {
    try {
      final filaObj = ParseObject('Fila');
      filaObj.objectId = id;
      filaObj.set<int>('status', FilaStatus.SAIUDAFILA.index);

      final response = await filaObj.update();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Fila>> getMyFila(User user) async {
    ParseUser currentUser = ParseUser.forQuery();
    currentUser.objectId = user.id;

    final q = QueryBuilder<ParseObject>(ParseObject('Fila'));
    q.setLimit(100);
    q.orderByDescending('createdAt');
    q.whereEqualTo('responsavel', currentUser.toPointer());
    q.includeObject(
        ['responsavel.matricula', 'matricula.turma.escola', 'matricula.owner']);
    final response = await q.query();

    if (response.success && response.results != null) {
      List<ParseObject> res = response.results as List<ParseObject>;

      return res.map((e) {
        return Fila.fromJson(e.objectId!, e.toJson(), e: e);
      }).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
