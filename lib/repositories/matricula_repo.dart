import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class MatriculaRepo {
  Future save(Matricula m) async {
    try {
      ParseUser currentUser = ParseUser.forQuery();
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
}
