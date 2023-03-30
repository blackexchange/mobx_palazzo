import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class MatriculaRepo {
  Future save(Matricula m) async {
    try {
      ParseUser currentUser = ParseUser.forQuery();
      ParseUser responsavelUser = ParseUser.forQuery();
      currentUser.objectId = m.user?.id;

      final matriculaObj = ParseObject('Matriculas');

      final parseACL = ParseACL(owner: currentUser);
      parseACL.setPublicReadAccess(allowed: true);
      parseACL.setPublicWriteAccess(allowed: true);

      matriculaObj.setACL(parseACL);

      matriculaObj.set<String?>('nome', m.nome);
      matriculaObj.set<bool?>('especial', m.especial);
      matriculaObj.set<num?>('status', m.status.index);
      matriculaObj.set<String>('descricao', '');
      matriculaObj.set<String?>('phone', m.phone);
      matriculaObj.set<String?>('email', m.email);

      matriculaObj.set<String?>('bairro', m.address?.bairro);
      matriculaObj.set<String?>('cidade', m.address?.cidade.nome);
      matriculaObj.set<String?>('uf', m.address?.uf.sigla);
      matriculaObj.set<String?>('cep', m.address?.cep);

      matriculaObj.set<ParseUser>('owner', currentUser);

      final retUser = await _getUserByEmail(m.email!);
      if (retUser != null) {
        responsavelUser.objectId = "xUC07jCLXr";
        responsavelUser.username = "";
        responsavelUser.password = "";
        responsavelUser.emailAddress = "";
        //  currentUser.objectId = "xUC07jCLXr";
        matriculaObj.set<List<ParseUser>>('responsaveis', [responsavelUser]);
      }

      matriculaObj.set<ParseObject>(
          'turma', ParseObject('Turmas')..set('objectId', m.turma?.id));

      final response = await matriculaObj.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<ParseUser?> _getUserByEmail(String email) async {
    final u = QueryBuilder<ParseUser>(ParseUser.forQuery());
    u.whereEqualTo('email', email);
    final response = await u.query();

    if (response.success && response.result != null) {
      ParseUser pUser = response.result.first;
      return pUser;
    } else {
      return null;
    }
  }

  Future<List<Matricula>?> getMatriculas(String search) async {
    final q = QueryBuilder<ParseObject>(ParseObject('Matriculas'));
    q.includeObject(['owner', 'turma', 'turma.escola']);

//    q.setLimit(20);
    //q.whereNotEqualTo('status', MatriculaStatus.INATIVO.index);

    if (search != null && search.trim().isNotEmpty) {
      q.whereContains('nome', search, caseSensitive: false);
    }

    q.orderByDescending('createdAt');

    //q.whereMatchesQuery('turma', (ParseObject('Turmas')))

    //  final u = QueryBuilder<ParseUser>(ParseUser.forQuery());

    //q.whereMatchesQuery('owner', u);

    // u.whereEqualTo('type', UserType.ADMIN.index);

    final response = await q.query();

    if (response.success && response.results != null) {
      List<ParseObject> res = response.results as List<ParseObject>;

      return res.map((e) {
        return Matricula.fromJson(e.objectId!, e.toJson(), e: e);
      }).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
