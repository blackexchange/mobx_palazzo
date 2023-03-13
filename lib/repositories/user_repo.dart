import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../helpers/helpers.dart';

import '../models/models.dart';

class UserRepo {
  Future<User> signUp(User user) async {
    final parseObj = ParseUser(user.email, user.senha, user.email);

    parseObj.set<String>('nome', user.nome);
    parseObj.set<String>('telefone', user.telefone);
    parseObj.set('tipo', user.tipo.index);

    final response = await parseObj.signUp();

    if (response.success) {
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
